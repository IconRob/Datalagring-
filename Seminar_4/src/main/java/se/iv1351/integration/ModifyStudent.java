package se.iv1351.integration;
import java.sql.ResultSet;
import java.util.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import se.iv1351.database.DatabaseOperations;
import java.sql.Statement;
import java.time.LocalDate;


public class ModifyStudent {
    private Connection connection;
    private DatabaseOperations databaseOperations;


    public ModifyStudent(Connection connection) {
        this.connection = connection;
        this.databaseOperations = new DatabaseOperations(connection);
    }

    public DatabaseOperations getDatabaseOperations() {
        return databaseOperations;
    }

    public boolean addStudent(String firstName, String lastName, String personNumber, String street, String zip, String city) {
        try {
            // Skapa en SQL-fråga för att lägga till en student i tabellen "student"
            String insertQuery = "INSERT INTO student (first_name, last_name, person_number, street, zip, city) VALUES (?, ?, ?, ?, ?, ?)";

            // Förbered ett PreparedStatement för att utföra SQL-frågan
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, personNumber);
            preparedStatement.setString(4, street);
            preparedStatement.setString(5, zip);
            preparedStatement.setString(6, city);

            // Utför SQL-frågan och få antalet påverkade rader
            int rowsAffected = preparedStatement.executeUpdate();

            // Stäng PreparedStatement
            preparedStatement.close();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteStudent(int studentId) {
        try {
            // Skapa en SQL-fråga för att ta bort en student med ett visst student_id
            String deleteQuery = "DELETE FROM student WHERE student_id = ?";

            // Förbered ett PreparedStatement för att utföra SQL-frågan
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, studentId);

            // Utför SQL-frågan och få antalet påverkade rader
            int rowsAffected = preparedStatement.executeUpdate();

            // Stäng PreparedStatement
            preparedStatement.close();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ResultSet getAvailableInstruments() {
        ResultSet resultSet = null;
        try {
            // Uppdaterad SQL-fråga för att inkludera kontroll av aktiv uthyrning
            String query = "SELECT ir.* FROM instrument_rental ir " +
                    "LEFT JOIN instrument_booking ib ON ir.instrument_rental_id = ib.instrument_rental_id " +
                    "AND ib.end_date > CURRENT_DATE " +
                    "WHERE ir.available = TRUE AND (ib.is_active IS NULL OR ib.is_active = FALSE)";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }


    /*public ResultSet getAvailableInstruments() {
        ResultSet resultSet = null;
        try {
            String query = "SELECT * FROM instrument_rental WHERE available = TRUE";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }*/

    public boolean rentInstrument(int studentId, int instrumentRentalId) {
        Connection conn = null;
        PreparedStatement rentalStmt = null;
        PreparedStatement bookingStmt = null;
        PreparedStatement updateStmt = null;

        try {
            conn = this.connection;
            conn.setAutoCommit(false); // Inaktivera auto-commit

            if (!canRentMoreInstruments(studentId)) {
                return false; // Studenten har redan hyrt max antal instrument
            }

            // Skapa en ny bokning för instrumentet --
            String insertBooking = "INSERT INTO instrument_booking (instrument_rental_id, start_date, end_date, delivery, is_active) VALUES (?, CURRENT_DATE, ?, FALSE, TRUE)";
            bookingStmt = conn.prepareStatement(insertBooking, Statement.RETURN_GENERATED_KEYS);
            bookingStmt.setInt(1, instrumentRentalId);
            bookingStmt.setDate(2, java.sql.Date.valueOf(LocalDate.now().plusMonths(1))); // Exempel: en månads uthyrning
            int bookingRowsAffected = bookingStmt.executeUpdate();

            // Hämta det genererade instrument_booking_id
            int instrumentBookingId = 0;
            if (bookingRowsAffected > 0) {
                ResultSet generatedKeys = bookingStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    instrumentBookingId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating booking failed, no ID obtained.");
                }
            }

            // Lägg till en ny rad i 'rental'-tabellen
            String insertRental = "INSERT INTO rental (student_id, instrument_booking_id) VALUES (?, ?)";
            rentalStmt = conn.prepareStatement(insertRental);
            rentalStmt.setInt(1, studentId);
            rentalStmt.setInt(2, instrumentBookingId);
            int rentalRowsAffected = rentalStmt.executeUpdate();

            // Uppdatera 'available' för instrumentet till 'false'
            if (rentalRowsAffected > 0) {
                String updateInstrument = "UPDATE instrument_rental SET available = FALSE WHERE instrument_rental_id = ?";
                updateStmt = conn.prepareStatement(updateInstrument);
                updateStmt.setInt(1, instrumentRentalId);
                updateStmt.executeUpdate();

                conn.commit(); // Commit transaktionen
                return true;
            }
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback om något går fel
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            try {
                if (rentalStmt != null) rentalStmt.close();
                if (bookingStmt != null) bookingStmt.close();
                if (updateStmt != null) updateStmt.close();
                if (conn != null) conn.setAutoCommit(true); // Återaktivera auto-commit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean canRentMoreInstruments(int studentId) {
        String query = "SELECT COUNT(*) AS active_rental_count " +
                "FROM rental r " +
                "INNER JOIN instrument_booking ib ON r.instrument_booking_id = ib.instrument_booking_id " +
                "WHERE r.student_id = ? AND ib.is_active = TRUE";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, studentId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int activeRentalCount = resultSet.getInt("active_rental_count");
                    return activeRentalCount < 2;  // Tillåt uthyrning om studenten har färre än 2 aktiva uthyrningar
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public List<String> getAllStudents() {
        List<String> students = new ArrayList<>();
        String query = "SELECT student_id, first_name, last_name FROM student";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                String student = rs.getInt("student_id") + " - " +
                        rs.getString("first_name") + " " +
                        rs.getString("last_name");
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public List<String> getAvailableInstruments1() {
        List<String> instruments = new ArrayList<>();
        String query = "SELECT instrument_rental_id, type, brand FROM instrument_rental WHERE available = TRUE";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                String instrument = rs.getInt("instrument_rental_id") + " - " +
                        rs.getString("type") + " (" +
                        rs.getString("brand") + ")";
                instruments.add(instrument);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return instruments;
    }

    // Metod för att avsluta en uthyrning
    public boolean terminateRental(int instrumentBookingId) {
        Connection conn = null;
        PreparedStatement terminateStmt = null;
        PreparedStatement updateStmt = null;

        try {
            conn = this.connection;
            conn.setAutoCommit(false); // Inaktivera auto-commit

            // Uppdatera 'is_active' till FALSE i 'instrument_booking'-tabellen
            String terminateQuery = "UPDATE instrument_booking SET is_active = FALSE, end_date = CURRENT_DATE WHERE instrument_booking_id = ?";
            terminateStmt = conn.prepareStatement(terminateQuery);
            terminateStmt.setInt(1, instrumentBookingId);
            int terminateRowsAffected = terminateStmt.executeUpdate();

            if (terminateRowsAffected > 0) {
                // Uppdatera 'available' till TRUE i 'instrument_rental'-tabellen
                String updateQuery = "UPDATE instrument_rental SET available = TRUE WHERE instrument_rental_id = (SELECT instrument_rental_id FROM instrument_booking WHERE instrument_booking_id = ?)";
                updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setInt(1, instrumentBookingId);
                updateStmt.executeUpdate();

                conn.commit(); // Commit transaktionen
                return true;
            }
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback om något går fel
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            try {
                if (terminateStmt != null) terminateStmt.close();
                if (updateStmt != null) updateStmt.close();
                if (conn != null) conn.setAutoCommit(true); // Återaktivera auto-commit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }



}
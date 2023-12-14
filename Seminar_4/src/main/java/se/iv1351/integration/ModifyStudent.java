package se.iv1351.integration;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import se.iv1351.database.DatabaseOperations;
import java.sql.Statement;
import java.time.LocalDate;

/**
 * The ModifyStudent class provides methods for modifying student information and instrument rentals.
 */
public class ModifyStudent {
    private Connection connection;
    private DatabaseOperations databaseOperations;

    /**
     * Creates a new instance of the ModifyStudent class with the specified database connection.
     *
     * @param connection The database connection.
     */
    public ModifyStudent(Connection connection) {
        this.connection = connection;
        this.databaseOperations = new DatabaseOperations(connection);
    }

    /**
     * Retrieves the DatabaseOperations object associated with this ModifyStudent instance.
     *
     * @return The DatabaseOperations object.
     */
    public DatabaseOperations getDatabaseOperations() {
        return databaseOperations;
    }

    /**
     * Adds a new student to the database.
     *
     * @param firstName    The first name of the student.
     * @param lastName     The last name of the student.
     * @param personNumber The personal identification number of the student.
     * @param street       The street address of the student.
     * @param zip          The postal code of the student's city.
     * @param city         The city where the student lives.
     * @return True if the student was successfully added, false otherwise.
     */
    public boolean addStudent(String firstName, String lastName, String personNumber, String street, String zip, String city) {
        try {
            // Create an SQL query to add a student to the "student" table
            String insertQuery = "INSERT INTO student (first_name, last_name, person_number, street, zip, city) VALUES (?, ?, ?, ?, ?, ?)";

            // Prepare a PreparedStatement to execute the SQL query
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, personNumber);
            preparedStatement.setString(4, street);
            preparedStatement.setString(5, zip);
            preparedStatement.setString(6, city);

            // Execute the SQL query and get the number of affected rows
            int rowsAffected = preparedStatement.executeUpdate();

            // Close the PreparedStatement
            preparedStatement.close();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Deletes a student from the database.
     *
     * @param studentId The ID of the student to delete.
     * @return True if the student was successfully deleted, false otherwise.
     */
    public boolean deleteStudent(int studentId) {
        try {
            // Create an SQL query to delete a student with a specific student_id
            String deleteQuery = "DELETE FROM student WHERE student_id = ?";

            // Prepare a PreparedStatement to execute the SQL query
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, studentId);

            // Execute the SQL query and get the number of affected rows
            int rowsAffected = preparedStatement.executeUpdate();

            // Close the PreparedStatement
            preparedStatement.close();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Retrieves a ResultSet of available instruments with active rentals.
     *
     * @return A ResultSet containing information about available instruments.
     */
    public ResultSet getAvailableInstruments() {
        ResultSet resultSet = null;
        try {
            // Updated SQL query to include active rental checking
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

    /**
     * Attempts to rent an instrument for a student.
     *
     * @param studentId The ID of the student requesting the instrument.
     * @param instrumentRentalId The ID of the instrument to be rented.
     * @return True if the instrument was successfully rented, false otherwise.
     */
    public boolean rentInstrument(int studentId, int instrumentRentalId) {
        Connection conn = null;
        PreparedStatement rentalStmt = null;
        PreparedStatement bookingStmt = null;
        PreparedStatement updateStmt = null;

        try {
            conn = this.connection;
            conn.setAutoCommit(false); // Disable auto-commit

            // Check if the student can rent more instruments
            if (!canRentMoreInstruments(studentId)) {
                return false; // The student has already rented the maximum number of instruments
            }

            // Create a new booking for the instrument
            String insertBooking = "INSERT INTO instrument_booking (instrument_rental_id, start_date, end_date, delivery, is_active) VALUES (?, CURRENT_DATE, ?, FALSE, TRUE)";
            bookingStmt = conn.prepareStatement(insertBooking, Statement.RETURN_GENERATED_KEYS);
            bookingStmt.setInt(1, instrumentRentalId);
            bookingStmt.setDate(2, java.sql.Date.valueOf(LocalDate.now().plusMonths(1))); // Exempel: en månads uthyrning
            int bookingRowsAffected = bookingStmt.executeUpdate();

            // Get the generated instrument_booking_id
            int instrumentBookingId = 0;
            if (bookingRowsAffected > 0) {
                ResultSet generatedKeys = bookingStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    instrumentBookingId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating booking failed, no ID obtained.");
                }
            }

            // Add a new entry in the 'rental' table
            String insertRental = "INSERT INTO rental (student_id, instrument_booking_id) VALUES (?, ?)";
            rentalStmt = conn.prepareStatement(insertRental);
            rentalStmt.setInt(1, studentId);
            rentalStmt.setInt(2, instrumentBookingId);
            int rentalRowsAffected = rentalStmt.executeUpdate();

            // Update 'available' for the instrument to 'false'
            if (rentalRowsAffected > 0) {
                String updateInstrument = "UPDATE instrument_rental SET available = FALSE WHERE instrument_rental_id = ?";
                updateStmt = conn.prepareStatement(updateInstrument);
                updateStmt.setInt(1, instrumentRentalId);
                updateStmt.executeUpdate();

                conn.commit(); // Commit the transaction
                return true;
            }
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback if an error occurs
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
                if (conn != null) conn.setAutoCommit(true); // Re-enable auto-commit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * Checks if a student can rent more instruments.
     *
     * @param studentId The ID of the student to check.
     * @return True if the student can rent more instruments, false otherwise.
     */
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
                    return activeRentalCount < 2;  // Allow renting if the student has fewer than 2 active rentals
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Terminates a rental and updates the availability of the associated instrument.
     *
     * @param instrumentBookingId The ID of the instrument booking to terminate.
     * @return True if the rental was successfully terminated, false otherwise.
     */
    public boolean terminateRental(int instrumentBookingId) {
        Connection conn = null;
        PreparedStatement terminateStmt = null;
        PreparedStatement updateStmt = null;

        try {
            conn = this.connection;
            conn.setAutoCommit(false); // // Disable auto-commit

            // Update 'is_active' to FALSE in 'instrument_booking' table
            String terminateQuery = "UPDATE instrument_booking SET is_active = FALSE, end_date = CURRENT_DATE WHERE instrument_booking_id = ?";
            terminateStmt = conn.prepareStatement(terminateQuery);
            terminateStmt.setInt(1, instrumentBookingId);
            int terminateRowsAffected = terminateStmt.executeUpdate();

            if (terminateRowsAffected > 0) {
                // Update 'available' to TRUE in 'instrument_rental' table
                String updateQuery = "UPDATE instrument_rental SET available = TRUE WHERE instrument_rental_id = (SELECT instrument_rental_id FROM instrument_booking WHERE instrument_booking_id = ?)";
                updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setInt(1, instrumentBookingId);
                updateStmt.executeUpdate();

                conn.commit(); // Commit the transaction
                return true;
            }
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback if something goes wrong
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            try {
                if (terminateStmt != null) terminateStmt.close();
                if (updateStmt != null) updateStmt.close();
                if (conn != null) conn.setAutoCommit(true); // Re-enable auto-commit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}

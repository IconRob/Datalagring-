package se.iv1351.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;
import se.iv1351.model.Instrument;
import java.sql.PreparedStatement;
import java.sql.ResultSet;




public class DatabaseOperations {
    private Connection connection;

    public DatabaseOperations(Connection connection) {
        this.connection = connection;
    }

    // Metod för att hämta alla tillgängliga instrument för uthyrning
    public List<Instrument> getAvailableInstruments() {
        List<Instrument> instruments = new ArrayList<>();
        String query = "SELECT * FROM instrument_rental WHERE available = TRUE";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Instrument instrument = new Instrument(
                        resultSet.getInt("instrument_rental_id"),
                        resultSet.getString("type"),
                        resultSet.getString("brand"),
                        resultSet.getFloat("price_per_month"),
                        resultSet.getString("category"),
                        resultSet.getDate("date")
                );
                instruments.add(instrument);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return instruments;
    }

    //Metod för att hämta alla studenter.
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
        // Uppdaterad fråga för att kontrollera både tillgänglighet och aktiv uthyrningsstatus
        String query = "SELECT ir.instrument_rental_id, ir.type, ir.brand " +
                "FROM instrument_rental ir " +
                "LEFT JOIN instrument_booking ib ON ir.instrument_rental_id = ib.instrument_rental_id " +
                "WHERE ir.available = TRUE AND (ib.is_active IS NULL OR ib.is_active = FALSE)";

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


    //Metod för att hitta tillgängliga instrument
   /* public List<String> getAvailableInstruments1() {
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
    }*/

    public List<String> getActiveRentals() {
        List<String> activeRentals = new ArrayList<>();
        String query = "SELECT r.student_id, r.instrument_booking_id, ib.instrument_rental_id " +
                "FROM rental r INNER JOIN instrument_booking ib " +
                "ON r.instrument_booking_id = ib.instrument_booking_id " +
                "WHERE ib.is_active = TRUE";  // Hämta endast aktiva uthyrningar

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                String rental = "Student ID: " + rs.getInt("student_id") +
                        ", Booking ID: " + rs.getInt("instrument_booking_id") +
                        ", Instrument ID: " + rs.getInt("instrument_rental_id");
                activeRentals.add(rental);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activeRentals;
    }

}

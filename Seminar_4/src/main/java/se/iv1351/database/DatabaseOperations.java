package se.iv1351.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;
import se.iv1351.model.Instrument;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



/**
 * The DatabaseOperations class provides methods for interacting with the database.
 */
public class DatabaseOperations {
    private Connection connection;

    /**
     * Creates a new instance of the DatabaseOperations class with the specified database connection.
     *
     * @param connection The database connection.
     */
    public DatabaseOperations(Connection connection) {
        this.connection = connection;
    }

    /**
     * Retrieves a list of all available instruments for rental.
     *
     * @return A list of Instrument objects representing available instruments.
     */
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

    /**
     * Retrieves a list of all students.
     *
     * @return A list of student names.
     */
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

    /**
     * Retrieves a list of all available instruments using an updated query to check both availability and active rental status.
     *
     * @return A list of strings representing available instruments.
     */
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

    /**
     * Retrieves a list of all active rentals.
     *
     * @return A list of strings representing active rentals.
     */
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

package se.iv1351.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;
import se.iv1351.model.Instrument;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * The DatabaseOperations class provides a collection of methods to interact with the database.
 * These methods allow for various operations like retrieving available instruments, listing students,
 * and checking active rentals.
 */
public class DatabaseOperations {
    private Connection connection;

    /**
     * Constructs a new DatabaseOperations object using the provided database connection.
     *
     * @param connection The database connection to be used for executing SQL queries.
     */
    public DatabaseOperations(Connection connection) {
        this.connection = connection;
    }

    /**
     * Retrieves a list of all available instruments for rental. It queries the instrument_rental
     * table to find instruments that are marked as available.
     *
     * @return A List of Instrument objects, each representing an available instrument with details
     *         like rental ID, type, brand, price per month, category, and date.
     * @throws SQLException If an SQL error occurs during query execution.
     */
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

    /**
     * Fetches a list of all students from the database. Each student is represented by a string
     * concatenating their ID and full name.
     *
     * @return A List of Strings, with each string representing a student in the format "ID - Full Name".
     * @throws SQLException If an SQL error occurs during query execution.
     */
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

    /**
     * Retrieves a list of available instruments, ensuring they are not currently rented out.
     * This is achieved by an updated query that checks both availability and active rental status.
     *
     * @return A List of Strings, each representing an available instrument, including its rental ID, type, and brand.
     * @throws SQLException If an SQL error occurs during query execution.
     */
    public List<String> getAvailableInstruments1() {
        List<String> instruments = new ArrayList<>();
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

    /**
     * Retrieves a list of all active instrument rentals. 
     * It joins the rental and instrument_booking tables to extract information about currently active instrument rentals.
     *
     * @return A List of Strings, each representing an active rental with details like student ID, 
     *         booking ID, and instrument rental ID.
     * @throws SQLException If an SQL error occurs during query execution.
     */
    public List<String> getActiveRentals() {
        List<String> activeRentals = new ArrayList<>();
        String query = "SELECT r.student_id, r.instrument_booking_id, ib.instrument_rental_id " +
                "FROM rental r INNER JOIN instrument_booking ib " +
                "ON r.instrument_booking_id = ib.instrument_booking_id " +
                "WHERE ib.is_active = TRUE";  // Fetch only active rentals

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

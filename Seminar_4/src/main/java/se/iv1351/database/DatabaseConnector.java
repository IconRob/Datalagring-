package se.iv1351.database;
/**
 * @file DatabaseConnector.java
 * @brief This file contains the DatabaseConnector class, which is used to establish a connection to the PostgreSQL database.
 * @package se.iv1351.database
 */
import java.sql.Connection;     // Used to establish a connection with the database
import java.sql.DriverManager;  // Manages the list of database drivers
import java.sql.SQLException;   // Handles SQL-related exceptions

/**
 * @class DatabaseConnector
 * @brief Establishes a connection to a PostgreSQL database.
 * @details This class contains methods to connect to a PostgreSQL database using JDBC. It uses predefined URL, username, and password for the connection.
 * @author 
 */
public class DatabaseConnector {

    /**
     * @brief Database URL for PostgreSQL connection.
     * @details Change the URL to match the database location and version.
     */
    private final String url = "jdbc:postgresql://localhost:5433/soundgood_ver_4";

    /**
     * @brief Database user for PostgreSQL.
     * @details Replace with the actual username for the database.
     */
    private final String user = "postgres";

    /**
     * @brief Database password for PostgreSQL.
     * @details Replace with the actual password for the database.
     */
    private final String password = "";

    /**
     * @brief Connects to the PostgreSQL database.
     * @return Connection object or null if the connection fails.
     * @details Attempts to establish a connection to the PostgreSQL database using the provided URL, user, and password. If the connection is successful, it prints a success message. Otherwise, it catches and prints the SQLException.
     */
    public Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Ansluten till PostgreSQL-databasen framgångsrikt.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}

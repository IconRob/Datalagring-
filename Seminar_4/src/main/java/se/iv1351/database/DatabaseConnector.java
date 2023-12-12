package se.iv1351.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    private final String url = "jdbc:postgresql://localhost:5433/soundgood_ver_4";
    private final String user = "postgres";
    private final String password = "";


    /**
     * Attempts to establish a connection to the PostgreSQL database.
     *
     * @return A database Connection object if the connection is successful, or null otherwise.
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

package se.iv1351.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    private final String url = "jdbc:postgresql://localhost:5433/soundgood_ver_4";
    private final String user = "postgres"; // Byt ut mot ditt faktiska användarnamn
    private final String password = ""; // Byt ut mot ditt faktiska lösenord

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

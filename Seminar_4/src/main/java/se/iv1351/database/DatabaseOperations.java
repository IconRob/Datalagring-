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
}

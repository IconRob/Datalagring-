package se.iv1351.integration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ModifyStudent {
    private Connection connection;

    public ModifyStudent(Connection connection) {
        this.connection = connection;
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
}
package se.iv1351.startup;

import se.iv1351.database.DatabaseConnector;
import se.iv1351.integration.ModifyStudent;
import se.iv1351.gui.MainApplication;
import javax.swing.*;
import java.sql.Connection;

/**
 * The Main class is the entry point of the program.
 * It attempts to establish a database connection and starts the GUI.
 */
public class Main {
    /**
     * The main method is the starting point of the application.
     *
     * @param args Command-line arguments (not used in this application).
     */
    public static void main(String[] args) {
        // Attempt to establish a database connection
        DatabaseConnector databaseConnector = new DatabaseConnector();
        Connection connection = databaseConnector.connect();

        // Check if the connection was successful
        if (connection == null) {
            JOptionPane.showMessageDialog(null, "Failed to connect to the database.");
            return;
        }

        // Run the GUI in the event dispatch thread
        SwingUtilities.invokeLater(new Runnable() {
            /**
             * The run method starts the GUI with a ModifyStudent instance.
             */
            public void run() {
                // Pass the ModifyStudent instance to MainApplication
                ModifyStudent modifyStudent = new ModifyStudent(connection);
                new MainApplication(modifyStudent);
            }
        });
    }
}

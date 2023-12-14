package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * The `RentalStudentWindow` class represents a graphical user interface (GUI) window that displays
 * a list of available instruments for rent in the Soundgood Music School. It retrieves instrument
 * data from the `ModifyStudent` instance and displays it in a table format.
 */
public class RentalStudentWindow extends JFrame {
    private ModifyStudent modifyStudent;
    private JTable instrumentTable;

    /**
     * Constructs a `RentalStudentWindow` object with the provided `ModifyStudent` instance.
     *
     * @param modifyStudent The `ModifyStudent` instance used to retrieve available instrument data.
     */
    public RentalStudentWindow(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;
        setTitle("Available Instruments for Rent");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        // Retrieve instrument data from ModifyStudent
        ResultSet resultSet = modifyStudent.getAvailableInstruments();
        String[] columnNames = {"Instrument ID", "Type", "Brand", "Price per Month"/*, "Category", "Date Available"*/};
        DefaultTableModel tableModel = new DefaultTableModel(columnNames, 0);

        try {
            while (resultSet.next()) {
                int id = resultSet.getInt("instrument_rental_id");
                String type = resultSet.getString("type");
                String brand = resultSet.getString("brand");
                float price = resultSet.getFloat("price_per_month");
                //String category = resultSet.getString("category");
                // Note: The date is converted to a String for display in the table
                //String date = resultSet.getDate("date").toString();

                // Add a row to the table model
                tableModel.addRow(new Object[]{id, type, brand, price/*, category, date*/});
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the ResultSet and PreparedStatement if no longer needed
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Create a table to display the instrument data
        instrumentTable = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(instrumentTable);
        add(scrollPane);

        // Make the window visible
        setLocationRelativeTo(null);
        setVisible(true);
    }
}
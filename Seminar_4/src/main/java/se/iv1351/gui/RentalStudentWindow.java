package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RentalStudentWindow extends JFrame {
    private ModifyStudent modifyStudent;
    private JTable instrumentTable;

    public RentalStudentWindow(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;
        setTitle("Available Instruments for Rent");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        // Hämta instrumentdata
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
                // Notera: Datumet konverteras till String för att visa i tabellen
                //String date = resultSet.getDate("date").toString();

                // Lägg till rad i tabellmodellen
                tableModel.addRow(new Object[]{id, type, brand, price/*, category, date*/});
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Stäng ResultSet och PreparedStatement om de inte längre behövs
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Skapa tabellen med datan
        instrumentTable = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(instrumentTable);
        add(scrollPane);

        // Gör fönstret synligt
        setLocationRelativeTo(null);
        setVisible(true);
    }
}

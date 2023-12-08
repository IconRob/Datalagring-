package se.iv1351.gui;
import se.iv1351.integration.ModifyStudent;
import java.sql.ResultSet;
import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
import java.sql.Date;





import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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
        String[] columnNames = {"Instrument ID", "Type", "Brand", "Price per Month", /*"Category", "Date Available"*/};
        DefaultTableModel tableModel = new DefaultTableModel(columnNames, 0);

        try {
            while (resultSet.next()) {
                int id = resultSet.getInt("instrument_rental_id");
                String type = resultSet.getString("type");
                String brand = resultSet.getString("brand");
                float price = resultSet.getFloat("price_per_month");
                //String category = resultSet.getString("category");
                //Date date = resultSet.getDate("date");

                // Lägg till rad i tabellmodellen
                tableModel.addRow(new Object[] {id, type, brand, price, /*category, date*/});
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
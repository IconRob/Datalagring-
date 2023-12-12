package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import se.iv1351.database.DatabaseOperations;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class InstrumentRentalWindow extends JFrame {
    private ModifyStudent modifyStudent;
    private JComboBox<String> studentComboBox, instrumentComboBox;
    private JButton rentButton, terminateButton;

    public InstrumentRentalWindow(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;
        setTitle("Instrument Rental");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new GridLayout(4, 2, 10, 10));

        studentComboBox = new JComboBox<>();
        instrumentComboBox = new JComboBox<>();
        rentButton = new JButton("Rent Instrument");
        terminateButton = new JButton("Terminate Rental");

        loadStudentData();
        loadInstrumentData();

        rentButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                rentInstrument();
            }
        });

        terminateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                terminateRental();
            }
        });

        add(new JLabel("Student:"));
        add(studentComboBox);
        add(new JLabel("Instrument:"));
        add(instrumentComboBox);
        add(rentButton);
        add(terminateButton);

        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void loadStudentData() {
        List<String> students = modifyStudent.getDatabaseOperations().getAllStudents();
        for (String student : students) {
            studentComboBox.addItem(student);
        }
    }

    private void loadInstrumentData() {
        List<String> instruments = modifyStudent.getDatabaseOperations().getAvailableInstruments1();
        for (String instrument : instruments) {
            instrumentComboBox.addItem(instrument);
        }
    }

    private void rentInstrument() {
        String selectedStudent = (String) studentComboBox.getSelectedItem();
        String selectedInstrument = (String) instrumentComboBox.getSelectedItem();

        int studentId = Integer.parseInt(selectedStudent.split(" - ")[0]);
        int instrumentId = Integer.parseInt(selectedInstrument.split(" - ")[0]);

        if (modifyStudent.rentInstrument(studentId, instrumentId)) {
            JOptionPane.showMessageDialog(null, "Instrument rented successfully!");
        } else {
            JOptionPane.showMessageDialog(null, "Failed to rent instrument.");
        }
    }

    private void terminateRental() {
        // Implementera logiken för att avsluta en uthyrning
        // Exempelvis kan du ha en annan JComboBox för att välja vilken uthyrning som ska avslutas
    }
}

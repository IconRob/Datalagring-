package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import se.iv1351.database.DatabaseOperations;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

/**
 * The `InstrumentRentalWindow` class represents a graphical user interface (GUI) window
 * for renting an instrument to a student.
 *
 * It allows the user to select a student and an available instrument from dropdown lists
 * and click the "Rent Instrument" button to initiate the instrument rental process
 * using the `ModifyStudent` class.
 */
public class InstrumentRentalWindow extends JFrame {
    private ModifyStudent modifyStudent;
    private JComboBox<String> studentComboBox, instrumentComboBox;
    private JButton rentButton;

    /**
     * Constructs an `InstrumentRentalWindow` object with the provided `ModifyStudent` instance.
     *
     * @param modifyStudent The `ModifyStudent` instance used for renting instruments to students.
     */
    public InstrumentRentalWindow(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;
        setTitle("Instrument Rental");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new GridLayout(4, 2, 10, 10));

        studentComboBox = new JComboBox<>();
        instrumentComboBox = new JComboBox<>();
        rentButton = new JButton("Rent Instrument");

        loadStudentData();
        loadInstrumentData();

        // Adding action listeners for the buttons
        rentButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                rentInstrument();
            }
        });


        // Adding components to the layout
        add(new JLabel("Student:"));
        add(studentComboBox);
        add(new JLabel("Instrument:"));
        add(instrumentComboBox);
        add(rentButton);

        // Finalize window setup
        setLocationRelativeTo(null);
        setVisible(true);
    }

    /**
     * Loads student data from the database and populates the student combo box.
     */
    private void loadStudentData() {
        List<String> students = modifyStudent.getDatabaseOperations().getAllStudents();
        for (String student : students) {
            studentComboBox.addItem(student);
        }
    }

    /**
     * Loads available instrument data from the database and populates the instrument combo box.
     */
    private void loadInstrumentData() {
        List<String> instruments = modifyStudent.getDatabaseOperations().getAvailableInstruments1();
        for (String instrument : instruments) {
            instrumentComboBox.addItem(instrument);
        }
    }

    /**
     * Initiates the instrument rental process by obtaining the selected student and instrument
     * and invoking the `rentInstrument` method of `ModifyStudent`.
     */
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

}


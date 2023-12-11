package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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

        studentComboBox = new JComboBox<>(); // Fyll denna med student-ID:n
        instrumentComboBox = new JComboBox<>(); // Fyll denna med tillgängliga instrument-ID:n
        rentButton = new JButton("Rent Instrument");
        terminateButton = new JButton("Terminate Rental");

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

    private void rentInstrument() {
        // Hämta vald student och instrument
        String studentId = (String) studentComboBox.getSelectedItem();
        String instrumentId = (String) instrumentComboBox.getSelectedItem();

        // Implementera logiken för att hyra ett instrument
        // Kontrollera om studenten redan hyr två instrument

        // Visa feedback till användaren
    }

    private void terminateRental() {
        // Implementera logiken för att avsluta en pågående uthyrning
        // Visa feedback till användaren
    }
}

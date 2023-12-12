package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

/**
 * TerminateRentalWindow class provides a GUI window for terminating active instrument rentals.
 * It allows users to select an active rental and terminate it.
 */

public class TerminateRentalWindow extends JFrame {
    private ModifyStudent modifyStudent;
    private JComboBox<String> rentalComboBox;
    private JButton terminateButton;
    /**
     * Constructs a TerminateRentalWindow with a ModifyStudent instance for handling rental terminations.
     *
     * @param modifyStudent An instance of ModifyStudent for managing instrument rentals.
     */
    public TerminateRentalWindow(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;
        setTitle("Terminate Rental");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new GridLayout(2, 2, 10, 10));

        rentalComboBox = new JComboBox<>();
        terminateButton = new JButton("Terminate Rental");

        loadRentalData();

        terminateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                terminateRental();
            }
        });

        add(new JLabel("Select Rental:"));
        add(rentalComboBox);
        add(terminateButton);

        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void loadRentalData() {
        rentalComboBox.removeAllItems();  // Rensa befintliga poster
        List<String> rentals = modifyStudent.getDatabaseOperations().getActiveRentals();
        for (String rental : rentals) {
            rentalComboBox.addItem(rental);
        }
    }

    private void terminateRental() {
        String selectedRental = (String) rentalComboBox.getSelectedItem();
        if (selectedRental != null && !selectedRental.isEmpty()) {
            try {
                // Antag att formatet är "Student ID: [id], Booking ID: [id], Instrument ID: [id]"
                // Vi extraherar delen som innehåller "Booking ID: [id]"
                String bookingPart = selectedRental.split(",")[1].trim();
                int instrumentBookingId = Integer.parseInt(bookingPart.split(":")[1].trim());

                if (modifyStudent.terminateRental(instrumentBookingId)) {
                    JOptionPane.showMessageDialog(null, "Rental terminated successfully!");
                } else {
                    JOptionPane.showMessageDialog(null, "Failed to terminate rental.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(null, "Error processing rental termination.");
            }
        } else {
            JOptionPane.showMessageDialog(null, "No rental selected.");
        }
    }




    /*private void terminateRental() {
        String selectedRental = (String) rentalComboBox.getSelectedItem();
        if (selectedRental != null && !selectedRental.isEmpty()) {
            try {
                String bookingPart = selectedRental.split(",")[1].trim();
                int instrumentBookingId = Integer.parseInt(bookingPart.split(":")[1].trim());

                if (modifyStudent.terminateRental(instrumentBookingId)) {
                    JOptionPane.showMessageDialog(null, "Rental terminated successfully!");
                    loadRentalData();  // Uppdatera listan av pågående uthyrningar
                } else {
                    JOptionPane.showMessageDialog(null, "Failed to terminate rental.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(null, "Error processing rental termination.");
            }
        } else {
            JOptionPane.showMessageDialog(null, "No rental selected.");
        }
    }*/
}
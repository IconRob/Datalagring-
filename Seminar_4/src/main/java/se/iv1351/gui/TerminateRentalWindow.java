package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

/**
 * The `TerminateRentalWindow` class represents a graphical user interface (GUI) window that allows
 * the termination of instrument rentals in the Soundgood Music School. It displays a list of active
 * rentals retrieved from the `ModifyStudent` instance and provides the functionality to terminate a
 * selected rental.
 */

public class TerminateRentalWindow extends JFrame {
    private ModifyStudent modifyStudent;
    private JComboBox<String> rentalComboBox;
    private JButton terminateButton;

    /**
     * Constructs a `TerminateRentalWindow` object with the provided `ModifyStudent` instance.
     *
     * @param modifyStudent The `ModifyStudent` instance used to terminate rentals and retrieve active rental data.
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

    /**
     * Load active rental data into the rental combo box.
     */
    private void loadRentalData() {
        rentalComboBox.removeAllItems();  // Rensa befintliga poster
        List<String> rentals = modifyStudent.getDatabaseOperations().getActiveRentals();
        for (String rental : rentals) {
            rentalComboBox.addItem(rental);
        }
    }

    /**
     * Terminate the selected rental and display a message based on the termination result.
     */
    private void terminateRental() {
        String selectedRental = (String) rentalComboBox.getSelectedItem();
        if (selectedRental != null && !selectedRental.isEmpty()) {
            try {
                // Assume the format is "Student ID: [id], Booking ID: [id], Instrument ID: [id]"
                // Extract the part containing "Booking ID: [id]"
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
}
package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import se.iv1351.gui.TerminateRentalWindow;

/**
 * The `MainApplication` class represents the main graphical user interface (GUI) application
 * for managing student records and instrument rentals in the Soundgood Music School.
 *
 * It provides buttons to access various functionalities, such as adding students, deleting students,
 * viewing available instruments for rental, renting instruments, and terminating instrument rentals.
 * These functionalities are triggered by opening different windows associated with each button.
 */
public class MainApplication extends JFrame {
    private JButton addButton, deleteButton, avalibleInstrumentButton, rentalButton, terminateRentalButton;
    private ModifyStudent modifyStudent;

    /**
     * Constructs a `MainApplication` object with the provided `ModifyStudent` instance.
     *
     * @param modifyStudent The `ModifyStudent` instance used for managing student records and instrument rentals.
     */
    public MainApplication(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;



        // Create buttons and label
        JLabel windowLabel = new JLabel("Soundgood Adminpanel");
        addButton = new JButton("Add Student");
        deleteButton = new JButton("Delete Student");
        avalibleInstrumentButton = new JButton("Instruments for rental");
        rentalButton = new JButton("Rent Instrument");
        terminateRentalButton = new JButton("End rental");



        // Set up button actions to open corresponding windows
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new AddStudentWindow(modifyStudent); // Open the AddStudentWindow
            }
        });

        deleteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new DeleteStudentWindow(modifyStudent); // Open the DeleteStudentWindow
            }
        });

        avalibleInstrumentButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new RentalStudentWindow(modifyStudent); // Open the Rental StudentWindow
            }
        });

        rentalButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new InstrumentRentalWindow(modifyStudent); // Open the Rental StudentWindow
            }
        });

        terminateRentalButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new TerminateRentalWindow(modifyStudent); // Open the TerminateRentalWindow
            }
        });

        // Layout the buttons and labels in the main window
        setLayout(null);

        windowLabel.setBounds(175,25,300,25);
        windowLabel.setFont(new Font(null,Font.PLAIN,20));
        add(windowLabel);

        addButton.setBounds(115,100,125,25);
        addButton.setFocusable(false);

        deleteButton.setBounds(115,150,125,25);
        deleteButton.setFocusable(false);

        avalibleInstrumentButton.setBounds(300, 100, 200, 25);
        avalibleInstrumentButton.setFocusable(false);

        rentalButton.setBounds(300, 150, 200, 25);
        rentalButton.setFocusable(false);

        terminateRentalButton.setBounds(300, 250, 200, 25);
        terminateRentalButton.setFocusable(false);

        add(avalibleInstrumentButton);
        add(addButton);
        add(deleteButton);
        add(rentalButton);
        add(terminateRentalButton);

        // Window setup
        setLocationRelativeTo(null);
        setTitle("Soundgood Music School");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
        //setLocationRelativeTo(null);
    }
}
package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainApplication extends JFrame {
    private JButton addButton, deleteButton, rentalButton;
    private ModifyStudent modifyStudent;

    public MainApplication(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;



        // Create buttons
        JLabel windowLabel = new JLabel("Soundgood Adminpanel");
        addButton = new JButton("Add Student");
        deleteButton = new JButton("Delete Student");
        rentalButton = new JButton("Instruments for rental");


        // Set up button actions
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

        rentalButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new RentalStudentWindow(modifyStudent); // Open the Rental StudentWindow
            }
        });

        // Layout the buttons in the main window
        setLayout(null);

        windowLabel.setBounds(175,25,300,25);
        windowLabel.setFont(new Font(null,Font.PLAIN,20));
        add(windowLabel);

        addButton.setBounds(115,100,125,25);
        addButton.setFocusable(false);

        deleteButton.setBounds(115,150,125,25);
        deleteButton.setFocusable(false);

        rentalButton.setBounds(300, 100, 200, 25);
        rentalButton.setFocusable(false);

        add(rentalButton);
        add(addButton);
        add(deleteButton);







        // Window setup
        setLocationRelativeTo(null);
        setTitle("Soundgood Music School");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
        //setLocationRelativeTo(null);
    }
}
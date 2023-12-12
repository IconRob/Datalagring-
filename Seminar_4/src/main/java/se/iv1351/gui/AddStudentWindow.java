package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * The AddStudentWindow class provides a GUI window for adding new students to the database.
 * It allows the user to enter student details and submit them.
 */
public class AddStudentWindow extends JFrame {
    private JTextField firstNameField, lastNameField, personNumberField, streetField, zipField, cityField;
    private JButton submitButton;
    private ModifyStudent modifyStudent;

    /**
     * Constructs an AddStudentWindow with a ModifyStudent instance for database operations.
     *
     * @param modifyStudent An instance of ModifyStudent for handling student modifications.
     */
    public AddStudentWindow(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;

        // Initialize components
        firstNameField = new JTextField(20);
        lastNameField = new JTextField(20);
        personNumberField = new JTextField(20);
        streetField = new JTextField(20);
        zipField = new JTextField(20);
        cityField = new JTextField(20);
        submitButton = new JButton("Submit");

        // Adding action listener for the submit button
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String firstName = firstNameField.getText();
                String lastName = lastNameField.getText();
                String personNumber = personNumberField.getText();
                String street = streetField.getText();
                String zip = zipField.getText();
                String city = cityField.getText();

                boolean success = modifyStudent.addStudent(firstName, lastName, personNumber, street, zip, city);

                if (success) {
                    JOptionPane.showMessageDialog(null, "Student added successfully!");
                } else {
                    JOptionPane.showMessageDialog(null, "Failed to add student.");
                }
            }
        });

        // Layout the components
        setLayout(new GridLayout(7, 2));
        add(new JLabel("First Name:"));
        add(firstNameField);
        add(new JLabel("Last Name:"));
        add(lastNameField);
        add(new JLabel("Person Number:"));
        add(personNumberField);
        add(new JLabel("Street:"));
        add(streetField);
        add(new JLabel("Zip:"));
        add(zipField);
        add(new JLabel("City:"));
        add(cityField);
        add(submitButton);

        // Window setup
        pack();
        setTitle("Add Student");
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);
        setVisible(true);
    }
}

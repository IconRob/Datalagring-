package se.iv1351.gui;

import se.iv1351.integration.ModifyStudent;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class DeleteStudentWindow extends JFrame {
    private JTextField studentIdField;
    private JButton deleteButton;
    private ModifyStudent modifyStudent;

    public DeleteStudentWindow(ModifyStudent modifyStudent) {
        this.modifyStudent = modifyStudent;

        // Initialize components
        studentIdField = new JTextField(20);
        deleteButton = new JButton("Delete");

        deleteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int studentId;
                try {
                    studentId = Integer.parseInt(studentIdField.getText());
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(null, "Please enter a valid student ID.");
                    return;
                }

                boolean success = modifyStudent.deleteStudent(studentId);

                if (success) {
                    JOptionPane.showMessageDialog(null, "Student deleted successfully!");
                } else {
                    JOptionPane.showMessageDialog(null, "Failed to delete student.");
                }
            }
        });

        // Layout the components
        setLayout(new GridLayout(2, 2));
        add(new JLabel("Student ID:"));
        add(studentIdField);
        add(deleteButton);

        // Window setup
        pack();
        setTitle("Delete Student");
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);
        setVisible(true);
    }
}

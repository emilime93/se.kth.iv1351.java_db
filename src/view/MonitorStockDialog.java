package view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MonitorStockDialog extends JFrame {

    private JPanel contentPanel;

    private JLabel storeLabel = new JLabel("Store:");
    private JLabel productLabel = new JLabel("Product:");
    private JLabel emailLabel = new JLabel("Email:");
    private JTextField storeInput = new JTextField(25);
    private JTextField productInput = new JTextField(25);
    private JTextField emailInput = new JTextField(25);

    private JButton submitButton = new JButton("Submit");

    public MonitorStockDialog(String title) {
        super(title);
        initializeUI();
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void initializeUI() {

        contentPanel = new JPanel(new GridBagLayout());
        getContentPane().add(contentPanel);

        GridBagConstraints constraints = new GridBagConstraints();
        constraints.gridx = 0;
        constraints.gridy = 0;

        // Input field
        contentPanel.add(storeLabel, constraints);
        constraints.gridy++;

        contentPanel.add(productLabel, constraints);
        constraints.gridy++;

        contentPanel.add(emailLabel, constraints);
        constraints.gridy++;


        constraints.gridx = 1;
        constraints.gridy = 0;

        contentPanel.add(storeInput, constraints);
        constraints.gridy++;

        contentPanel.add(productInput, constraints);
        constraints.gridy++;

        contentPanel.add(emailInput, constraints);
        constraints.gridy++;

        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //TODO
            }
        });
        contentPanel.add(submitButton, constraints);
    }


}

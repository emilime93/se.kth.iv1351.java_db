package view;

import javax.swing.*;
import java.awt.*;

public class MainFrame extends JFrame {

    private final int WINDOW_WIDTH = 700;
    private final int WINDOW_HEIGHT = 500;

    private JPanel mainPanel;
    private JTextArea inputArea;
    private JTextArea resultArea;

    private JButton runQueryButton;

    private GroupLayout layoutManager;

    public MainFrame() {
        super();
    }

    public MainFrame(String frameName) {
        super(frameName);
        initializeFrame();
        finalizeFrame();
    }

    private void finalizeFrame() {
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
//        setSize(new Dimension(WINDOW_WIDTH, WINDOW_HEIGHT));
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
        setResizable(false);
    }

    /**
     * Initializes the frame. Such as adding components, their listeners and setting the layout.
     */
    private void initializeFrame() {
        mainPanel = new JPanel(new GridBagLayout());
        getContentPane().add(mainPanel);

        GridBagConstraints constraints = new GridBagConstraints();
        constraints.gridx = 0;
        constraints.gridy = 0;

        inputArea = new JTextArea(10, 40);
        inputArea.setBackground(new Color(150,150,150));
        JScrollPane scrollPane = new JScrollPane(inputArea);
        scrollPane.setBorder(BorderFactory.createTitledBorder("Input:"));
        mainPanel.add(scrollPane, constraints);
        constraints.gridy++;

        resultArea = new JTextArea(10, 40);
        resultArea.setEditable(false);
        JScrollPane resultScrollPane = new JScrollPane(resultArea);
        resultScrollPane.setBorder(BorderFactory.createTitledBorder("Results:"));
        mainPanel.add(resultScrollPane, constraints);
        constraints.gridy++;

        runQueryButton = new JButton("Run");
        mainPanel.add(runQueryButton, constraints);
    }


}

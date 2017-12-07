package view;

import javax.swing.*;
import java.awt.*;

public class MainFrame extends JFrame {

    private final int WINDOW_WIDTH = 700;
    private final int WINDOW_HEIGHT = 500;

    private JPanel mainPanel = new JPanel();
    private JTextArea inputArea = new JTextArea();
    private JTextArea resultArea = new JTextArea();

    private JButton runQueryButton = new JButton("Run");

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
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(new Dimension(WINDOW_WIDTH, WINDOW_HEIGHT));
        setLocationRelativeTo(null);
        setVisible(true);
        setResizable(false);
    }

    private void initializeFrame() {
        layoutManager = new GroupLayout(mainPanel);
        mainPanel.setLayout(layoutManager);

        getContentPane().add(mainPanel);

//        mainPanel.add(runQueryButton);
        
    }


}

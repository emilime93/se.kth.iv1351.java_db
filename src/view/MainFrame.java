package view;

import controller.Controller;
import model.Product;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class MainFrame extends JFrame implements View {

    // TODO Set the controller before I create the menu, otherwise null-pointer

    private final int WINDOW_WIDTH = 700;
    private final int WINDOW_HEIGHT = 500;

    // The menu
    private JMenuBar menuBar;
    private JMenu mainMenu;

    // All panels
    private JPanel mainPanel;
    private JTextArea inputArea;
    private JTextArea resultArea;

    private JButton runQueryButton;

    private Controller controller;

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
        // Create the menu
        createMenu();
        setJMenuBar(menuBar);

        mainPanel = new JPanel(new GridBagLayout());
        getContentPane().add(mainPanel);

        GridBagConstraints constraints = new GridBagConstraints();
        constraints.gridx = 0;
        constraints.gridy = 0;

        // Input field
        inputArea = new JTextArea(10, 40);
        JScrollPane scrollPane = new JScrollPane(inputArea);
        scrollPane.setBorder(BorderFactory.createTitledBorder("Input:"));
        mainPanel.add(scrollPane, constraints);
        constraints.gridy++;

        // Output field
        resultArea = new JTextArea(10, 40);
        resultArea.setEditable(false);
        JScrollPane resultScrollPane = new JScrollPane(resultArea);
        resultScrollPane.setBorder(BorderFactory.createTitledBorder("Results:"));
        mainPanel.add(resultScrollPane, constraints);
        constraints.gridy++;

        // Run button
        runQueryButton = new JButton("Run");
        runQueryButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        mainPanel.add(runQueryButton, constraints);
    }

    private void createMenu() {
        menuBar = new JMenuBar();

        mainMenu = new JMenu("Action");
        menuBar.add(mainMenu);

        JMenuItem menuItem1 = new JMenuItem("Hämta alla produkter");
        menuItem1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
//                TODO enable this when null pointer is solved
                displayProducts(controller.getProducts());
//                inputArea.append(e.getActionCommand());
            }
        });
        mainMenu.add(menuItem1);

        JMenuItem menuItem2 = new JMenuItem("Lägg till bevakning");
        menuItem2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new MonitorStockDialog("Lägg till bevakning");
            }
        });
        mainMenu.add(menuItem2);

        JMenuItem menuItem3 = new JMenuItem("Item 3");
        menuItem3.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                inputArea.append(e.getActionCommand());
            }
        });
        mainMenu.add(menuItem3);

        JMenuItem menuItem4 = new JMenuItem("Item 4");
        menuItem4.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                inputArea.append(e.getActionCommand());
            }
        });
        mainMenu.add(menuItem4);

    }

    private void displayProducts(ArrayList<Product> productList) {
        for (Product p : productList) {
            this.resultArea.append(p.toString() + "\n");
        }
        // TODO display the products
    }

    public void setController(Controller controller) {
        this.controller = controller;
    }

    @Override
    public void runProgram() {
        // TODO
    }
}

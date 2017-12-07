package controller;

import model.Product;
import view.MainFrame;

import java.util.ArrayList;

public class Controller {

    private MainFrame mainFrame;

    public Controller(MainFrame frame) {
        this.mainFrame = frame;
        mainFrame.setController(this);
    }

    public ArrayList<Product> getProducts() {
        // TODO Make this return all products in a ArrayList
        ArrayList<Product> alp = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            alp.add(new Product("Product " + i));
        }
        return null;
    }
}

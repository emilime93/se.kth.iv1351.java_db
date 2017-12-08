package controller;

import model.Product;
import model.ProductsHandler;
import view.MainFrame;

import java.util.ArrayList;

public class Controller {

    ProductsHandler productsHandler;

    public Controller(MainFrame frame) {
        frame.setController(this);
        productsHandler = new ProductsHandler();
    }

    public ArrayList<Product> getProducts() {
        return productsHandler.getProducts();
    }
}

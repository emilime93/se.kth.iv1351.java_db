package controller;

import model.Product;
import model.ProductsHandler;
import view.MainFrame;
import view.View;

import java.util.ArrayList;

public class Controller {

    ProductsHandler productsHandler;

    public Controller(View frame) {
        frame.setController(this);
        productsHandler = new ProductsHandler();
        frame.runProgram();
    }

    public ArrayList<Product> getProducts() {
        return productsHandler.getProducts();
    }
}

package controller;

import model.Product;
import model.ProductsHandler;
import model.Store;
import model.StoreManager;
import view.MainFrame;
import view.View;

import java.util.ArrayList;

public class Controller {

    ProductsHandler productsHandler;
    StoreManager storeManager;

    public Controller(View frame) {
        frame.setController(this);
        productsHandler = new ProductsHandler();
        storeManager = new StoreManager();
        frame.runProgram();
    }

    public ArrayList<Product> getProducts() {
        return productsHandler.getProducts();
    }

    public ArrayList<Store> getStoresWithoutStock(String name, String platform) {
        Product product = new Product(name, platform);
        return storeManager.getStoresWithoutStock(product);
    }
}

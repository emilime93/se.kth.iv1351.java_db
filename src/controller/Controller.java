package controller;

import model.*;
import view.View;

import java.util.ArrayList;

public class Controller {

    private static final String USER_EMAIL = "p12@mvg.se";

    ProductsHandler productsHandler;
    StoreManager storeManager;
    StockMonitorManager stockMonitorManager;

    public Controller(View frame) {
        frame.setController(this);
        productsHandler = new ProductsHandler();
        storeManager = new StoreManager();
        stockMonitorManager = new StockMonitorManager();
        frame.runProgram();
    }

    public ArrayList<Product> getProducts() {
        return productsHandler.getProducts();
    }

    public String getProductId(Product product) {
        return productsHandler.getProductId(product);
    }

    public ArrayList<Store> getStoresWithoutStock(Product product) {
        return storeManager.getStoresWithoutStock(product);
    }

    public boolean addStockMonitor(Store store, Product product) {
        StockMonitor stockMonitor = new StockMonitor(USER_EMAIL, store.getStoreID(), product.getBarcode());
        return stockMonitorManager.addStockMonitor(stockMonitor);
    }
}

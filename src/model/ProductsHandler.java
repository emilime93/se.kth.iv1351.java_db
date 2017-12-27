package model;

import integration.DatabaseHandler;

import java.sql.SQLException;
import java.util.ArrayList;

public class ProductsHandler {

    private ArrayList<Product> products;
    private DatabaseHandler database;

    public ProductsHandler() {
        products = new ArrayList<>();
        database = DatabaseHandler.getDatabaseHandler();
    }

    public ArrayList<Product> getProducts() {
        updateProducts();
        return products;
    }

    /**
     * Unsure if I should handle the exception like this or not.
     */
    private void updateProducts() {
        try {
            products = database.getAllProducts();
        } catch (SQLException e) {
            products = new ArrayList<>();
            products.add(new Product("No products found"));
            e.printStackTrace();
        }
    }

    public String getProductId(Product product) {
        try {
            return database.getProductId(product);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<String> getPlatformsForGame(String gameName) {
        try {
            return database.getPlatformsForGame(gameName);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}

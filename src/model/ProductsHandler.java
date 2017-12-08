package model;

import integration.DatabaseHandler;

import java.sql.SQLException;
import java.util.ArrayList;

public class ProductsHandler {

    private ArrayList<Product> products;
    private DatabaseHandler database;

    public ProductsHandler() {
        products = new ArrayList<>();
        database = new DatabaseHandler();
    }

    public ArrayList<Product> getProducts() {
        updateProducts();
        return products;
    }

    private void updateProducts() {
        ArrayList<String> productNames = new ArrayList<>();
        try {
            productNames = database.getAllProductsByName(DatabaseHandler.getConnection(), "spelRVI");
        } catch (SQLException e) {
            System.out.println("Database connection failed");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        products.clear();
        for (String name : productNames) {
            products.add(new Product(name));
        }
    }
}

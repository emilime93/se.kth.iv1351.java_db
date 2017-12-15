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
//        products.clear();
        try {
            products = database.getAllProducts(DatabaseHandler.getConnection());
        } catch (SQLException e) {
            System.out.println("Database connection failed");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

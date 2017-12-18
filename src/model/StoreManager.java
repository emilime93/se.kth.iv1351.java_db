package model;

import integration.DatabaseHandler;

import java.sql.SQLException;
import java.util.ArrayList;

public class StoreManager {

    private ArrayList<Store> stores;
    private DatabaseHandler database;

    public StoreManager() {
        stores = new ArrayList<>();
        database = DatabaseHandler.getDatabaseHandler();
    }

    public ArrayList<Store> getStoresWithoutStock(Product product) {
        try {
            stores = database.getStoresWithNoStock(product);
        } catch (SQLException e) {
            stores = new ArrayList<>();
            stores.add(new Store("No stores found", null, null, null));
            e.printStackTrace();
        }
        return stores;
    }

}

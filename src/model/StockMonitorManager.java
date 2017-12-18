package model;

import integration.DatabaseHandler;

import java.sql.SQLException;

public class StockMonitorManager {

    public boolean addStockMonitor(StockMonitor stockMonitor) {
        try {
            DatabaseHandler.getDatabaseHandler().addStockMonitor(stockMonitor);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

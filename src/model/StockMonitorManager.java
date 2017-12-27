package model;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import integration.DatabaseHandler;

import java.sql.SQLException;

public class StockMonitorManager {

    public void addStockMonitor(StockMonitor stockMonitor) {
        try {
            DatabaseHandler.getDatabaseHandler().addStockMonitor(stockMonitor);
            System.out.println("Bevakningen tillagd.");
        } catch (MySQLIntegrityConstraintViolationException e) {
            System.out.println("Bevakningen fanns redan.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Bevakningen misslyckades.");
        }
    }
}

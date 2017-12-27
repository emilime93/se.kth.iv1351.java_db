package integration;
import model.Product;
import model.StockMonitor;
import model.Store;

import java.sql.*;
import java.util.ArrayList;

//How to connect, use in other layer.
//Connection con = getConnection();
//displayQuery(con, "SpelRsi");


public class DatabaseHandler {

    private static Connection connection;

    private static final String URL = "jdbc:mysql://localhost:3306/SpelRsi";
    private static final String driver = "com.mysql.jdbc.Driver";

    private static final String MYSQL_USERNAME = "root";
    private static final String MYSQL_PASSWORD = "tidabmajs";

    private static DatabaseHandler databaseHandler;

    private DatabaseHandler() {
        connect();
    }

    public static DatabaseHandler getDatabaseHandler() {
        if (databaseHandler == null) {
            return new DatabaseHandler();
        } else {
            return databaseHandler;
        }
    }

    private void connect() {
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(URL, MYSQL_USERNAME, MYSQL_PASSWORD);
            connection.setAutoCommit(false);
        } catch (Exception e) {
            System.out.println("Database connection error!");
            e.printStackTrace();
        }
    }

    public ArrayList<Product> getAllProducts() throws SQLException {
        Statement stmt = null;
        String query = "SELECT namn, plattform FROM Produkt, Spel WHERE Produkt.spel_ID = Spel.spelID;";

        ArrayList<Product> result = new ArrayList<>();

        stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            result.add(new Product(rs.getString("namn"), rs.getString("plattform")));
        }
        stmt.close();

        return result;
    }

    public ArrayList<Store> getStoresWithNoStock(Product product) throws SQLException {
        ResultSet result;
        PreparedStatement statement;

        ArrayList<Store> storeList = new ArrayList<>();

        String nameParam  = product.getName();
        String platformParam= product.getPlatform();

        String query = "SELECT butiksID, gatuadress, postNR, stad FROM Butik\n" +
                "WHERE butiksID NOT IN(\n" +
                "SELECT butiksID\n" +
                "FROM Butik, Produktlagersaldo, Produkt, Spel\n" +
                "WHERE butiksID = butik_ID\n" +
                "AND produkt = streckkod\n" +
                "AND spel_ID = spelID\n" +
                "AND plattform = ?\n" +
                "AND namn = ?);";

        statement = connection.prepareStatement(query);
        statement.setString(1, platformParam);
        statement.setString(2, nameParam);

        result = statement.executeQuery();

        while (result.next()) {
            storeList.add(new Store(result.getString("gatuadress"), result.getString("stad"), result.getString("postNR"), result.getString("butiksID")));
        }
        statement.close();
        return storeList;
    }

    public String getProductId(Product product) throws SQLException {
        ResultSet result;
        PreparedStatement statement;

        String query = "SELECT streckkod " +
                "FROM Produkt, Spel " +
                "WHERE plattform = ? " +
                "AND namn = ?;";
        statement = connection.prepareStatement(query);
        statement.setString(1, product.getPlatform());
        statement.setString(2, product.getName());

        result = statement.executeQuery();

        String resultId = null;

        while (result.next()) {
            resultId = result.getString("streckkod");
        }

        return resultId;
    }

    public boolean addStockMonitor(StockMonitor stockMonitor) throws SQLException {
        ResultSet result;
        PreparedStatement statement;

        ArrayList<Store> storeList = new ArrayList<>();

        String epostParam = stockMonitor.getEmail();
        String butikIDParam = stockMonitor.getStoreID();
        String produktParam = stockMonitor.getProductBarcode();

        String query = "INSERT INTO Bevakning (epost, butik_ID, produkt) " +
                "VALUES (?, ?, ?);";

        statement = connection.prepareStatement(query);
        statement.setString(1, epostParam);
        statement.setString(2, butikIDParam);
        statement.setString(3, produktParam);

        statement.executeUpdate();

        statement.close();

        // TODO Update me
        return true;
    }

    public ArrayList<String> getPlatformsForGame(String gameName) throws SQLException {
        PreparedStatement stmt;
        String query = "SELECT plattform FROM Produkt WHERE Produkt.spel_ID = (SELECT spelID FROM spel WHERE namn = ?);";

        ArrayList<String> result = new ArrayList<>();

        stmt = connection.prepareStatement(query);
        stmt.setString(1, gameName);

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            result.add(rs.getString("plattform"));
        }
        stmt.close();

        return result;
    }
}

package integration;
import model.Product;
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

        String query = "SELECT gatuaddress, postNR, stad FROM Butik\n" +
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
            storeList.add(new Store(result.getString("gatuaddress"), result.getString("stad"), result.getString("postNR")));
        }
        statement.close();
        return storeList;
    }
    
}

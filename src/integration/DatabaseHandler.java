package integration;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

//How to connect, use in other layer.
//Connection con = getConnection();
//displayQuery(con, "SpelRsi");


public class DatabaseHandler {

    private static final String MYSQL_USERNAME = "root";
    private static final String MYSQL_PASSWORD = "tidabmajs";

    public static ArrayList<Product> getAllProducts(Connection con, String dbName)
            throws SQLException, ClassNotFoundException {
        //Load MySQL driver
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);

        Statement stmt = null;
        String query = "SELECT namn, plattform FROM Produkt, Spel WHERE Produkt.spel_ID = Spel.spelID;";

        ArrayList<Product> result = new ArrayList<>();
        try {
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                result.add(new Product(rs.getString("namn"), rs.getString("plattform")));
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Connection error Error: ");
            sqle.printStackTrace();
        } finally {
            if (stmt != null) { stmt.close(); }
        }

        return result;
    }

    public static Connection getConnection() throws SQLException {

        Connection con = null;
        Properties connectionProps = new Properties();
        connectionProps.put("user", MYSQL_USERNAME);
        connectionProps.put("password", MYSQL_PASSWORD);

        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/SpelRsi",
                connectionProps);
        return con;
    }
    
}

package integration;
import java.sql.*;
import java.util.Properties;

//How to connect, use in other layer.
//Connection con = getConnection();
//viewTable(con, "SpelRsi");


public class DatabaseHandler {
    public static void displayQuery(Connection con, String dbName)
            throws SQLException, ClassNotFoundException {
        //Load MySQL driver
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);

        Statement stmt = null;
        String query = "SELECT namn\n" +
                "FROM Produkt, Spel\n" +
                "WHERE Produkt.spel_ID = Spel.spelID;\n";
        try {
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String beskrivning = rs.getString("namn");
                System.out.println(beskrivning + "\t");
            }
        }finally {
            if (stmt != null) { stmt.close(); }
        }
    }

    public static Connection getConnection() throws SQLException {

        Connection con = null;
        Properties connectionProps = new Properties();
        connectionProps.put("user", "root");
        connectionProps.put("password", "Nicock");

        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/SpelRsi",
                connectionProps);
        System.out.println("Connected to database");
        return con;
    }
    
}

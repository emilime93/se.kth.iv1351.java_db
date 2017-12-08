package starter;

import controller.Controller;
import view.MainFrame;
import integration.DatabaseHandler;

import java.sql.Connection;
import java.sql.SQLException;

public class Starter {

    public static void main(String[] args) {
        DatabaseHandler dbh = new DatabaseHandler();
        try {
            Connection connection = DatabaseHandler.getConnection();
            dbh.displayQuery(connection, "spelRVI");
        } catch (SQLException sqle) {
            System.out.println(sqle);
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }
        MainFrame frame = new MainFrame("spelRVI databse");
        Controller controller = new Controller(frame);
    }
}

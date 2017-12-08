package starter;

import controller.Controller;
import view.MainFrame;
import integration.DatabaseHandler;

import java.sql.Connection;
import java.sql.SQLException;

public class Starter {

    public static void main(String[] args) {
        MainFrame frame = new MainFrame("spelRVI databse");
        Controller controller = new Controller(frame);
    }
}

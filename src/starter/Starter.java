package starter;

import controller.Controller;
import view.CommandLineInterface;
import view.MainFrame;
import integration.DatabaseHandler;

import java.sql.Connection;
import java.sql.SQLException;

public class Starter {

    public static void main(String[] args) {
//        MainFrame frame = new MainFrame("spelRVI databse");

        CommandLineInterface cli = new CommandLineInterface();
        Controller controller = new Controller(cli);

    }
}

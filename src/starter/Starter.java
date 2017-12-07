package starter;

import controller.Controller;
import view.MainFrame;

public class Starter {

    public static void main(String[] args) {
        MainFrame frame = new MainFrame("spelRVI databse");
        Controller controller = new Controller(frame);
    }
}

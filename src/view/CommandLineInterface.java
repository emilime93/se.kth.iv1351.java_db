package view;

import controller.Controller;
import model.Product;

import java.util.Scanner;

public class CommandLineInterface implements View {

    private Scanner scannerIn = new Scanner(System.in);
    private Controller controller;

    public CommandLineInterface() {
    }

    public void runProgram() {
        String continueProgram;
        int choice;
        do {
            showMenu();
            choice = scannerIn.nextInt();
            switch (choice) {
                case 1:
                    displayAllProducts();
                    break;
                case 2:
                    showStoresWithoutStock();
                    break;
                case 3:
                    addStockMonitor();
                    break;
            }

            System.out.print("Vill du forsätta köra? (ja/nej)");
            continueProgram = scannerIn.next();

        } while(continueProgram.equalsIgnoreCase("ja"));
        scannerIn.close();
    }

    private void addStockMonitor() {
        System.out.println("addStockMonitor");
    }

    private void showStoresWithoutStock() {
        System.out.println("showStoresWithoutStock");
    }

    private void displayAllProducts() {
        System.out.println("----- PRODUCTS -----");
        for (Product p : controller.getProducts()) {
            System.out.println(p.toString());
        }
    }

    private void showMenu() {
        System.out.print("\n---------- MENY ----------\n" +
                "1. Lista alla produkter.\n" +
                "2. Lista butiker som INTE har en produkt i lager.\n" +
                "3. Lägg till ny bevakning.\n" +
                "--> ");
    }

    public void setController(Controller controller) {
        this.controller = controller;
    }

}

package view;

import controller.Controller;
import model.Product;
import model.Store;

import java.util.ArrayList;
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
        Scanner scannerIn = new Scanner(System.in);
        String gameName;
        String gamePlatform;
        String storeId;

        System.out.print("Ange spelnamn: ");
        gameName = scannerIn.nextLine();
        System.out.print("Ange plattform: ");
        gamePlatform = scannerIn.nextLine();
        Product product = new Product(gameName, gamePlatform, controller.getProductId(new Product(gameName, gamePlatform)));
        if (product == null) {
            System.out.println("FEL, fanns ingen sån produkt");
        }
        Store store;
        do {
            System.out.println("Vilken butik vill du lägga din bevakning i?");
            ArrayList<Store> stores = controller.getStoresWithoutStock(product);
            for (int i = 0; i < stores.size(); i++) {
                System.out.printf("%d. %s %s %s\n", i+1, stores.get(i).getAddress(), stores.get(i).getPostalCode(),
                        stores.get(i).getCity());
            }
            store = new Store(stores.get(scannerIn.nextInt()-1));
        } while (false);
        // TODO Real validation

        if (controller.addStockMonitor(store, product)) {
            System.out.println("Success");
        } else {
            System.out.println("fail");
        }
    }

    private void showStoresWithoutStock() {
        System.out.println("Du har valt att lista butiker som INTE har en produkt i lager.");
        String name;
        String platform;
        do {
            Scanner scannerIn = new Scanner(System.in);
            System.out.print("Vilket produktnamn gäller det?: ");
            name = scannerIn.nextLine();
            System.out.print("Vilken plattform gäller det?: ");
            platform = scannerIn.nextLine();
        } while (false);
        // TODO Add real validation above ^

        for (Store store : controller.getStoresWithoutStock(new Product(name, platform))) {
            System.out.println("- " + store);
        }
    }

    private void displayAllProducts() {
        System.out.println("----- PRODUCTS -----");
        for (Product p : controller.getProducts()) {
            System.out.println("- " + p);
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

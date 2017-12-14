package model;

public class StockMonitor {

    private int storeID;
    private int productBarcode;
    private String email;

    public StockMonitor(int storeID, int productBarcode, String email) {
        this.storeID = storeID;
        this.productBarcode = productBarcode;
        this.email = email;
    }

    public int getStoreID() {
        return storeID;
    }

    public int getProductBarcode() {
        return productBarcode;
    }

    public String getEmail() {
        return email;
    }
}

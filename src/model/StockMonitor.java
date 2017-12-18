package model;

public class StockMonitor {

    private String email;
    private String storeID;
    private String productBarcode;

    public StockMonitor(String email, String storeID, String productBarcode) {
        this.email = email;
        this.storeID = storeID;
        this.productBarcode = productBarcode;
    }

    public String getEmail() {
        return email;
    }

    public String getStoreID() {
        return storeID;
    }

    public String getProductBarcode() {
        return productBarcode;
    }
}


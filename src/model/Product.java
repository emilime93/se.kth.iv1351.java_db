package model;

public class Product {

    private String name;
    private String platform;
    private String barcode;

    public Product(String name, String platform, String barcode) {
        this.name = name;
        this.platform = platform;
        this.barcode = barcode;
    }

    public Product(String name, String platform) {
        this.name = name;
        this.platform = platform;
    }

    public Product(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getPlatform() {
        return platform;
    }

    @Override
    public String toString() {
        String strRep = String.format("%s för %s", name, platform);
        return strRep;
    }

    public String getBarcode() {
        return barcode;
    }
}

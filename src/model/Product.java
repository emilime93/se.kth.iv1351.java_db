package model;

public class Product {

    private String name;
    private String platform;

    public Product(String name, String plattform) {
        this.name = name;
        this.platform = plattform;
    }

    public Product(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        String strRep = String.format("%s för %s", name, platform);
        return strRep;
    }
}

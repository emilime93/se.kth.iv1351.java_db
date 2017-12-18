package model;

public class Store {

    private String address;
    private String city;
    private String postalCode;

    public Store(String address, String city, String postalCode) {
        this.address = address;
        this.city = city;
        this.postalCode = postalCode;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public String getPostalCode() {
        return postalCode;
    }

    @Override
    public String toString() {
        return String.format("SpelRSI i %s, på %s, %s", city, address, postalCode);
    }
}

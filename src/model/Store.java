package model;

public class Store {

    private String address;
    private String city;
    private String postalCode;
    private String storeID;

    public Store(String address, String city, String postalCode, String storeID) {
        this.address = address;
        this.city = city;
        this.postalCode = postalCode;
        this.storeID = storeID;
    }

    public Store(Store store) {
        this.address = store.getAddress();
        this.city = store.getCity();
        this.postalCode = store.getPostalCode();
        this.storeID = store.getStoreID();
    }

    public String getStoreID() {
        return storeID;
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

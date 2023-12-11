package se.iv1351.model; // Antag att detta är paketet där du placerar dina modeller

public class Instrument {
    private int id;
    private String type;
    private String brand;
    private float price;
    private String category;
    private java.sql.Date date;

    public Instrument(int id, String type, String brand, float price, String category, java.sql.Date date) {
        this.id = id;
        this.type = type;
        this.brand = brand;
        this.price = price;
        this.category = category;
        this.date = date;
    }

    // Getters (och eventuellt setters om du behöver dem)
    public int getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public String getBrand() {
        return brand;
    }

    public float getPrice() {
        return price;
    }

    public String getCategory() {
        return category;
    }

    public java.sql.Date getDate() {
        return date;
    }
}

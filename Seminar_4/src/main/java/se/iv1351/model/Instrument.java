package se.iv1351.model;

/**
 * Instrument class represents a musical instrument in the system.
 */
public class Instrument {
    private int id;
    private String type;
    private String brand;
    private float price;
    private String category;
    private java.sql.Date date;

    /**
     * Constructs an Instrument with specified details.
     *
     * @param id The ID of the instrument.
     * @param type The type of the instrument.
     * @param brand The brand of the instrument.
     * @param price The rental price of the instrument.
     * @param category The category of the instrument.
     * @param date The date the instrument is available from.
     */
    public Instrument(int id, String type, String brand, float price, String category, java.sql.Date date) {
        this.id = id;
        this.type = type;
        this.brand = brand;
        this.price = price;
        this.category = category;
        this.date = date;
    }

    // Getters and settera
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

package se.iv1351.model;

/**
 * The `Instrument` class represents a musical instrument with various attributes.
 * It provides methods to access and set information about the instrument.
 */
public class Instrument {
    private int id;
    private String type;
    private String brand;
    private float price;
    private String category;
    private java.sql.Date date;

    /**
     * Constructs an `Instrument` object with the specified attributes.
     *
     * @param id       The unique identifier of the instrument.
     * @param type     The type or category of the instrument (e.g., guitar, piano).
     * @param brand    The brand or manufacturer of the instrument.
     * @param price    The price of renting the instrument per month.
     * @param category The category or classification of the instrument (e.g., string, percussion).
     * @param date     The date when the instrument became available for rental.
     */
    public Instrument(int id, String type, String brand, float price, String category, java.sql.Date date) {
        this.id = id;
        this.type = type;
        this.brand = brand;
        this.price = price;
        this.category = category;
        this.date = date;
    }

    /**
     * Get the unique identifier of the instrument.
     *
     * @return The instrument's unique identifier.
     */
    public int getId() {
        return id;
    }

    /**
     * Get the type or category of the instrument.
     *
     * @return The instrument's type.
     */
    public String getType() {
        return type;
    }

    /**
     * Get the brand or manufacturer of the instrument.
     *
     * @return The instrument's brand.
     */
    public String getBrand() {
        return brand;
    }

    /**
     * Get the price of renting the instrument per month.
     *
     * @return The instrument's rental price per month.
     */
    public float getPrice() {
        return price;
    }

    /**
     * Get the category or classification of the instrument.
     *
     * @return The instrument's category.
     */
    public String getCategory() {
        return category;
    }

    /**
     * Get the date when the instrument became available for rental.
     *
     * @return The date when the instrument became available for rental.
     */
    public java.sql.Date getDate() {
        return date;
    }
}

package com.cyberlearn.model;

/**
 * Lab model -> represents practice labs.
 */
public class Lab {
    private int id;
    private String name;
    private String details;

    public Lab() {}

    public Lab(int id, String name, String details) {
        this.id = id;
        this.name = name;
        this.details = details;
    }

    // Getters & setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDetails() { return details; }
    public void setDetails(String details) { this.details = details; }
}

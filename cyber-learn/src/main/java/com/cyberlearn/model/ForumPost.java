package com.cyberlearn.model;

/**
 * ForumPost model -> used for forum discussions.
 */
public class ForumPost {
    private int id;
    private String userName;
    private String message;

    public ForumPost() {}

    public ForumPost(int id, String userName, String message) {
        this.id = id;
        this.userName = userName;
        this.message = message;
    }

    // Getters & setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
}

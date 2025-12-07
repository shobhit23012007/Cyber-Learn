-- Create database
CREATE DATABASE IF NOT EXISTS cyberlearn;
USE cyberlearn;

------------------------------------------------------------
-- USERS TABLE
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    email VARCHAR(150) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(50) DEFAULT 'user'
);

------------------------------------------------------------
-- COURSES TABLE
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT
);

------------------------------------------------------------
-- LABS TABLE
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS labs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    details TEXT
);

------------------------------------------------------------
-- CERTIFICATIONS TABLE
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS certifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_name VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

------------------------------------------------------------
-- FORUM POSTS TABLE
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS forum_posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(150),
    message TEXT
);

------------------------------------------------------------
-- DEFAULT ADMIN ACCOUNT
------------------------------------------------------------
INSERT INTO users (name, email, password, role)
VALUES ('Admin', 'admin@cyberlearn.com', 'admin123', 'admin');

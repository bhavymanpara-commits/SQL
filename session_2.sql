/*2.
Create a new database named 'foodie_app' to simulate a Zomato-style backend.*/

create database foodie_app;

use foodie_app;

/*3.
Write a CREATE TABLE statement to define a 'restaurants' table in the 'foodie_app' 
database with the following columns: id (integer, primary key), name (varchar/character, max 100), 
cuisine (varchar/character, max 50), rating (decimal, e.g., 4.5), and location (varchar/character, max 100).*/

CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(3,1),  
    location VARCHAR(100)
);

/*4.
Design and create a 'users' table for a Flipkart-style app with columns: user_id (primary key),
 username, email, phone_number, and created_at (date/time). Pick appropriate data types for each column.
 <br><br><em><strong>Hint:</strong> Think about which columns should be unique and which data types best
 fit email and phone numbers.</em>*/
 
 CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT, 
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*5.
Intentionally make a mistake in your CREATE TABLE statement (such as missing a comma or using an unsupported
 data type), run it, and then fix the error based on the message you receive.<br><br><em><strong>Hint:</strong>
 Take a screenshot of the error and the corrected SQL statement for your records.</em>*/
 
 /*(Incorrect SQL):*/
CREATE TABLE test_table (
    id INT PRIMARY KEY
    name VARCHAR(50)
);

/*(Corrected SQL):*/
CREATE TABLE test_table (
    id INT PRIMARY KEY, 
    name VARCHAR(50)
);

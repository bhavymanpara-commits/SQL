/*1.
Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration. Insert at least 5 records
 representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve all columns for 
 all songs.*/
 
 use music_streaming_app;
 
 CREATE TABLE MusicPlaylist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    genre VARCHAR(50),
    duration TIME
);

INSERT INTO MusicPlaylist (id, song_name, artist, genre, duration) 
VALUES 
    (1, 'Bohemian Rhapsody', 'Queen', 'Rock', '00:05:55'),
    (2, 'Blinding Lights', 'The Weeknd', 'Synth-pop', '00:03:20'),
    (3, 'Hotel California', 'Eagles', 'Rock', '00:06:30'),
    (4, 'Levitating', 'Dua Lipa', 'Pop', '00:03:23'),
    (5, 'Shape of You', 'Ed Sheeran', 'Pop', '00:03:53');

SELECT * FROM MusicPlaylist;
 
/*2.
Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, showing just the first 3 records
 using the LIMIT keyword.*/
 
 SELECT song_name, artist 
FROM MusicPlaylist 
LIMIT 3;
 
/*3.
Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. Write a SQL query to list
 all unique restaurant names where you have placed orders, using the DISTINCT keyword.*/
 
 CREATE TABLE FoodOrders (
    id INT PRIMARY KEY,
    restaurant VARCHAR(100),
    food_item VARCHAR(100),
    order_date DATE
);

INSERT INTO FoodOrders (id, restaurant, food_item, order_date) 
VALUES 
    (1, 'Pizza Hut', 'Pepperoni Pizza', '2026-09-10'),
    (2, 'Burger King', 'Whopper', '2026-09-11'),
    (3, 'Pizza Hut', 'Cheese Bread', '2026-09-11'),
    (4, 'Sushi Express', 'California Roll', '2026-09-12'),
    (5, 'Burger King', 'Whopper', '2026-09-13');
 
 SELECT DISTINCT restaurant 
FROM FoodOrders;
 
/*4.
Write a SQL query on the FoodOrders table to select food_item as 'Dish' and order_date as 'Date Ordered', displaying only these 
two columns with the column aliases in the output.*/

SELECT food_item AS Dish, order_date AS 'Date Ordered' 
FROM FoodOrders;

/*5.
You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2, but it returns an error or doesn't
 work as expected. Identify and fix the mistake in the query.<br><br><em><strong>Hint:</strong> Check the correct placement 
 and usage of the LIMIT keyword in SQL syntax.</em>*/
 
 SELECT DISTINCT food_item, restaurant 
FROM FoodOrders 
ORDER BY food_item ASC 
LIMIT 2;
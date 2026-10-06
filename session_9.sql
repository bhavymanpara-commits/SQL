/* 1. Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' 
(id, restaurant_id, dish_name, price). Insert at least 3 restaurants and 2-3 dishes
 for each restaurant. */
create table restaurants (
    id int,
    name varchar(50),
    city varchar(50)
);

create table dishes (
    id int,
    restaurant_id int,
    dish_name varchar(50),
    price decimal(10,2)
);

insert into restaurants (id, name, city) values 
(1, 'honest', 'ahmedabad'),
(2, 'tgb', 'surat'),
(3, 'mcdonalds', 'vadodara'),
(4, 'empty_cafe', 'rajkot'); 

insert into dishes (id, restaurant_id, dish_name, price) values 
(1, 1, 'pav bhaji', 150.00),
(2, 1, 'pulav', 120.00),
(3, 2, 'paneer tikka', 250.00),
(4, 2, 'dal makhani', 180.00),
(5, 3, 'mcveggie', 99.00),
(6, 3, 'french fries', 80.00),
(7, 99, 'orphan pizza', 300.00); 


/* 2. Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to
 how Zomato shows dish details with the restaurant info. */
select d.dish_name, d.price, r.name as restaurant_name, r.city 
from dishes d
inner join restaurants r on d.restaurant_id = r.id;


/* 3. Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.
Hint: Use LEFT JOIN so restaurants without dishes still appear in the results with NULL for dish columns. */
select r.name as restaurant_name, r.city, d.dish_name, d.price 
from restaurants r
left join dishes d on r.id = d.restaurant_id;


/* 4. Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might
 not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant). */
select d.dish_name, d.price, r.name as restaurant_name 
from restaurants r
right join dishes d on r.id = d.restaurant_id;


/* 5. Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify.
 Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, 
 and write the SQL query for it. */

/* 
Explanation:
We should use a LEFT JOIN because we want to retrieve all the playlists, even if a playlist is completely empty and has
 no songs in it. By keeping the 'playlists' table on the left side of the join, the query will return every playlist.
 If a playlist does not contain any songs, the song columns for that specific row will simply appear as NULL.
*/

select p.playlist_name, s.song_name 
from playlists p
left join songs s on p.id = s.playlist_id;
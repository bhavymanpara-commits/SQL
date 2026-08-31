
/* 1. Install MySQL or PostgreSQL on your system and create a new database named 'music_streaming_app' 
 using the command line or GUI tool of your choice.*/
 
create database music_streaming_app;

use music_streaming_app;

/*2.
Inside the 'music_streaming_app' database, create a table called 'playlists' with columns: playlist_id 
(integer, primary key), name (varchar), and created_by (varchar).*/

create table playlists(
  playlist_id int primary key,
  name varchar(20),
  created_by varchar(20)
  );
  
  /* 3. Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits',
  'Chill Vibes', and 'Workout Mix', each created by a different user.*/
  
  insert into playlists
  (playlist_id , name , created_by)
  values
  (101, "bollywood hits", "amit"),
  (102, "chill vibes", "falguni pathak"),
  (103, "workout mix", "jethalal");
  
  /* 4. Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' table.
  <br><br><em><strong>Hint:</strong> Use the WHERE clause to filter by the 'created_by' column.</em>*/
  
  select * from playlists
  where created_by = "amit";
  
  /* 5. Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL using
  an example from a food delivery app like Zomato. Paste the explanation you receive into your assignment.*/
  
  /*
  ans:-
        In a food delivery app like Zomato, a Table is like a completely organized register of "Restaurants".
		A Column represents the specific categories of details we want to store for every restaurant, such as "Restaurant_Name", 
        "Rating", or "Location".
        A Row (or record) represents one single, entire entry in that register. For example, one row would contain the complete
        details for a specific restaurant: (Dominos, 4.2, Adajan).
  */
  
  
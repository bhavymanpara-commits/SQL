/* 1. Create a table named Playlists with columns: id, user_id, playlist_name, and total_likes. Insert at least 8 
sample rows with different users and playlists, making sure some playlists have the same user_id. */

create table playlists (
    id int,
    user_id int,
    playlist_name varchar(50),
    total_likes int
);

insert into playlists (id, user_id, playlist_name, total_likes) values
(1, 101, 'gym hits', 850),
(2, 101, 'chill vibes', 420),
(3, 101, 'retro classics', 420),
(4, 102, 'party mix', 1200),
(5, 102, 'focus', 300),
(6, 103, 'road trip', 950),
(7, 103, 'podcasts', 150),
(8, 103, 'favorites', 950);


/* 2. Write a SQL query using ROW_NUMBER() and the OVER() clause to assign a unique row number to each playlist,
 ordered by total_likes in descending order. */
 
select id, user_id, playlist_name, total_likes, 
       row_number() over (order by total_likes desc) as row_num
from playlists;


/* 3. Use the RANK() function with the OVER() clause to rank all playlists by total_likes, and display the playlist_name,
 user_id, total_likes, and their rank. */
 
select playlist_name, user_id, total_likes, 
       rank() over (order by total_likes desc) as playlist_rank
from playlists;


/* 4. Write a SQL query using DENSE_RANK() and PARTITION BY user_id to rank each user's playlists by total_likes, showing 
playlist_name, user_id, total_likes, and dense rank.
Hint: This will show how popular each playlist is within each user's account, similar to how Spotify might rank your top playlists. */

select playlist_name, user_id, total_likes, 
       dense_rank() over (partition by user_id order by total_likes desc) as user_rank
from playlists;


/* 5. Imagine you want to show the top 2 playlists per user based on total_likes, like Spotify's 'Your Top Playlists' feature.
 Write a query using a window function to select only the top 2 playlists for each user. */
 
with ranked_playlists as (
    select playlist_name, user_id, total_likes,
           row_number() over (partition by user_id order by total_likes desc) as rank_num
    from playlists
)
select playlist_name, user_id, total_likes
from ranked_playlists
where rank_num <= 2;
/* 1. Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). 
Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers
 with no collaborations. */
create table influencers (
    id int,
    name varchar(50)
);

create table collaborations (
    id int,
    influencer1_id int,
    influencer2_id int,
    collab_date date
);

select i1.name as influencer, i2.name as partner_name
from influencers i1
join collaborations c on i1.id = c.influencer1_id
left join influencers i2 on c.influencer2_id = i2.id;


/* 2. Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) 
to display each playlist alongside its parent playlist name, similar to how Spotify shows nested playlists. */
create table playlists (
    id int,
    user_id int,
    playlist_name varchar(50),
    parent_playlist_id int
);

select p1.playlist_name as playlist, p2.playlist_name as parent_playlist
from playlists p1
left join playlists p2 on p1.parent_playlist_id = p2.id;


/* 3. Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount),
 write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users
 even if they have no orders or payments. */
create table users (
    id int,
    username varchar(50)
);

create table orders (
    id int,
    user_id int,
    order_date date
);

create table payments (
    id int,
    order_id int,
    amount decimal(10,2)
);

select u.username, o.order_date, p.amount
from users u
left join orders o on u.id = o.user_id
left join payments p on o.id = p.order_id;


/* 4. You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows
 for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were 
 happening. */
select distinct r.name as restaurant_name
from restaurants r
join reviews rev on r.id = rev.restaurant_id;

/*
Duplicates were happening because a single restaurant has multiple reviews in the reviews table, so the join creates
 a separate row for every single review
*/

/* 5. Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products
 with their category names, but use different join conditions in each. Briefly explain which join condition is
 more efficient and why. */
select p.product_name, c.category_name
from products p
inner join categories c on p.category_id = c.id;

select p.product_name, c.category_name
from products p, categories c
where p.category_id = c.id;

/*
The explicit inner join with the ON clause (the first query) is more standard and efficient because it clearly 
separates the join logic from the filtering logic, making it easier for the database engine to optimize and read.
*/
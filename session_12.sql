/* 1. Create a CTE using the WITH clause to select all products with a rating above 4.5 from a 'Products' table,
 similar to how Flipkart or Myntra might highlight top-rated items. */
 
with top_products as (
    select * from products 
    where rating > 4.5
)
select * from top_products;


/* 2. Rewrite a query that finds all restaurants in 'Ahmedabad' with delivery charges under 50 from a 'Restaurants' table,
 first using a subquery and then using a CTE. Compare both queries for readability.
Hint: Focus on making the CTE version cleaner and easier to understand. */

select * from (
    select * from restaurants where city = 'ahmedabad'
) as ahm_res
where delivery_charge < 50;

with ahm_res as (
    select * from restaurants 
    where city = 'ahmedabad'
)
select * from ahm_res 
where delivery_charge < 50;


/* 3. Using two CTEs in a single query, find the top 3 most-followed users and the top 3 most-liked posts from a 'Users' and
'Posts' table (think Instagram-style data). Output both lists in the same result set. */

with top_users as (
    select username as item_name, followers as count_value, 'user' as category
    from users
    order by followers desc
    limit 3
),
top_posts as (
    select post_title as item_name, likes as count_value, 'post' as category
    from posts
    order by likes desc
    limit 3
)
select * from top_users
union all
select * from top_posts;


/* 4. Write a recursive CTE that generates a list of dates for the next 7 days starting from today, similar to how BookMyShow
 shows available dates for movie bookings.
Hint: Use a base case for today and recursion to add one day at a time. */

with recursive date_list as (
    select curdate() as booking_date, 1 as day_count
    union all
    select date_add(booking_date, interval 1 day), day_count + 1
    from date_list
    where day_count < 7
)
select booking_date from date_list;


/* 5. Given a messy SQL query that finds all users with more than 1000 followers from a 'Users' table, refactor it to use
 a CTE for better clarity and maintainability. */
 
with popular_users as (
    select id, username, followers
    from users
)
select * from popular_users 
where followers > 1000;
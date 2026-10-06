/* 1. Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table
 whose average rating is higher than the average rating of all restaurants in the city. */
 
select r1.name, r1.city, r1.average_rating
from restaurants r1
where r1.average_rating > (
    select avg(r2.average_rating)
    from restaurants r2
    where r2.city = r1.city
);


/* 2. Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table
 along with the total number of orders they have placed from an 'Orders' table, like a summary you might see in a Zomato 
 user profile. */
 
select name, 
       (select count(*) from orders where orders.user_id = users.id) as total_orders
from users;


/* 3. Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have
 at least one review with a rating of 5 stars, as seen in BookMyShow's top-rated section. */
select title
from movies
where id in (
    select movie_id
    from reviews
    where rating = 5
);


/* 4. Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform who 
have sold products in every category listed in a 'Categories' table.
Hint: Use nested subqueries to compare seller's categories with the complete list of categories. */

select s.name
from sellers s
where (
    select count(distinct p.category_id)
    from products p
    where p.seller_id = s.id
) = (
    select count(id)
    from categories
);
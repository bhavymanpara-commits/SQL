/*1.
Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. Insert 5 sample rows with
 different users and order amounts, including at least one NULL value for total_amount.*/
 
 create table orders (
    order_id int,
    user_name varchar(50),
    total_amount decimal(10,2),
    order_date date
);

insert into orders (order_id, user_name, total_amount, order_date) values
(1, 'rahul', 1500.00, '2026-10-01'),
(2, 'pooja', 850.50, '2026-10-02'),
(3, 'rahul', null, '2026-10-03'),
(4, 'amit', 450.00, '2026-10-04'),
(5, 'pooja', 2200.75, '2026-10-05');
 
/*2.
Write a SQL query to count how many orders were placed by each user in the Orders table, displaying user_name and the number 
of orders as order_count.*/

select user_name, count(order_id) as order_count 
from orders 
group by user_name;

/*3.
Write a SQL query to calculate the average total_amount of all orders in the Orders table, making sure to ignore 
any NULL values.*/

select avg(total_amount) as average_amount 
from orders;

/*4.
Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest and lowest order amounts 
(MAX and MIN) from the Orders table, and display both values in a single result row.*/

select max(total_amount) as highest_amount, min(total_amount) as lowest_amount 
from orders;

/*5.
Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, but only include orders where
 total_amount is not NULL.<br><br><em><strong>Hint:</strong> Use a WHERE clause to filter out NULL values before
 applying the SUM function.</em>*/
 
 select sum(total_amount) as total_sales 
from orders 
where total_amount is not null;
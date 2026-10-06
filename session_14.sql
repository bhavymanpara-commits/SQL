/* 1. Create a table called Orders with columns: order_id, user_id, order_date, and total_amount. Insert at least 7 sample 
rows representing different users and dates, similar to how food orders appear in Zomato or Swiggy. */

create table orders (
    order_id int,
    user_id int,
    order_date date,
    total_amount decimal(10,2)
);

insert into orders (order_id, user_id, order_date, total_amount) values
(1, 101, '2026-10-01', 250.00),
(2, 101, '2026-10-03', 300.50),
(3, 102, '2026-10-02', 150.00),
(4, 101, '2026-10-05', 400.00),
(5, 103, '2026-10-01', 500.00),
(6, 102, '2026-10-04', 200.00),
(7, 101, '2026-10-06', 350.00);


/* 2. Write a SQL query using the LAG() function to show each user's order_id, order_date, and the total_amount of their
 previous order (if any), ordered by user and date.
Hint: Use PARTITION BY user_id and ORDER BY order_date in your window function. */

select order_id, user_id, order_date, total_amount,
       lag(total_amount) over (partition by user_id order by order_date) as previous_amount
from orders;


/* 3. Using the same Orders table, write a SQL query with the LEAD() function to display each order_id, order_date,
 and the next order's total_amount for the same user. */
 
select order_id, user_id, order_date, total_amount,
       lead(total_amount) over (partition by user_id order by order_date) as next_amount
from orders;


/* 4. Write a SQL query to calculate the running total of total_amount for each user, showing order_id, order_date, total_amount,
 and a column running_total that accumulates the sum as you move through each user's orders.
Hint: Use SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW). */

select order_id, user_id, order_date, total_amount,
       sum(total_amount) over (partition by user_id order by order_date rows between unbounded preceding and current row) as running_total
from orders;


/* 5. Write a SQL query to calculate a 3-order moving average of total_amount for each user, showing order_id, order_date,
 total_amount, and moving_avg columns.
Constraint: Use SUM() OVER() with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW to compute the moving average. */

select order_id, user_id, order_date, total_amount,
       avg(total_amount) over (partition by user_id order by order_date rows between 2 preceding and current row) as moving_avg
from orders;
/*1.
Create a table called Orders with columns: order_id, user_id, payment_method, and amount. Insert at least 8 sample 
records representing different users and payment methods (like UPI, Card, Wallet, COD).*/

create table orders (
    order_id int,
    user_id int,
    payment_method varchar(20),
    amount decimal(10,2)
);

insert into orders (order_id, user_id, payment_method, amount) values
(1, 101, 'upi', 200.00),
(2, 102, 'card', 450.00),
(3, 101, 'wallet', 150.00),
(4, 103, 'cod', 500.00),
(5, 104, 'upi', 350.00),
(6, 102, 'upi', 100.00),
(7, 105, 'card', 800.00),
(8, 103, 'wallet', 250.00);

/*2.
Write an SQL query to count how many orders were placed using each payment_method in the Orders table, similar to
 how Zomato shows payment breakdown in analytics.*/
 
 select payment_method, count(order_id) as order_count 
from orders 
group by payment_method;
 
/*3.
Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.*/

select user_id, sum(amount) as total_spend 
from orders 
group by user_id;

/*4.
Write an SQL query to show only those payment methods where the average order amount is greater than 300, using GROUP BY 
and HAVING.<br><br><em><strong>Hint:</strong> Use AVG(amount) in your HAVING clause.</em>*/

select payment_method, avg(amount) as avg_amount 
from orders 
group by payment_method 
having avg(amount) > 300;

/*5.
Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. Your examples
 should show a scenario where WHERE and HAVING filter different things.*/
 
/* where: it applies directly to the individual rows of a table before any grouping happens. you cannot use aggregate 
 functions (like sum, count, or avg) inside a where clause.

having: it is applied after the rows are grouped together. it is used to filter the final results based on those 
aggrselect user_id, sum(amount) as total_spend 
from orders 
group by user_id 
having sum(amount) > 500;egate functions.*/

select * from orders 
where amount > 200;

select user_id, sum(amount) as total_spend 
from orders 
group by user_id 
having sum(amount) > 500;


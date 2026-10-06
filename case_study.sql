/* 1. Write an SQL query to find the top 5 highest-rated restaurants in Koramangala that serve North Indian cuisine, 
using the Zomato Bangalore dataset. */

select name, rating
from zomato
where location = 'koramangala' and cuisines like '%north indian%'
order by rating desc
limit 5;


/* 2. Using SQL, calculate the average cost for two people for each cuisine type and list the 3 most expensive cuisines
 to eat in Bangalore. */
 
select cuisines, avg(cost_for_two) as average_cost
from zomato
group by cuisines
order by average_cost desc
limit 3;


/* 3. Find all restaurants that offer online delivery but have a rating below 3.0, and suggest a marketing strategy to 
improve their ratings based on your findings.
Hint: Look for patterns in location, cuisine, or price that might explain the low ratings. */

select name, location, cuisines, cost_for_two, rating
from zomato
where online_delivery = 'yes' and rating < 3.0;


/* 4. Write an SQL query to segment restaurants into three market segments based on average cost for two: budget (below 400),
mid-range (400-800), and premium (above 800). Count how many restaurants fall into each segment. */

select 
    case 
        when cost_for_two < 400 then 'budget'
        when cost_for_two between 400 and 800 then 'mid-range'
        else 'premium'
    end as market_segment,
    count(*) as restaurant_count
from zomato
group by market_segment;


/* 5. Use ChatGPT or Copilot to help you write an SQL query that lists the top 10 most popular restaurant chains 
(by number of outlets) in the dataset, then run and validate the query yourself.
Hint: Search for 'SQL group by count example' if you get stuck. */

select name, count(*) as number_of_outlets
from zomato
group by name
order by number_of_outlets desc
limit 10;
select avg(amount) from payment;

--rounds to two decimal points 
select round(avg(amount),2) from payment;

select min(amount) from payment;

select amount from payment order by amount;

select count(amount) from payment where amount = 0.00;

select count(customer_id), last_name
from customer
group by last_name;

--A company is looking to give two employees a bonus based on
--performance. The company decides that the employee who handled
--the most payments will receive the bonus. Which employee handled
--the most payments, and how much was the total of those payments
--they handled?

select staff_id, count(amount), sum(amount)
from payment
group by staff_id;

--A company is looking to send coupons to customers who spend the
--least amount of money in their store – they’re hoping to have them
--come in and spend more. They need a list of those 5 customers who
--spend the least.

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5

--A company is looking to expand its customer base for
--their new credit card. The requirements are that
--customers need to have at least a total of 35
--transaction payments.
--What customers by their customer_id are eligible for
--the credit card?



-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Grouping by multiple columns]: SELECT state, zipcode, COUNT(id) FROM purchases GROUP BY state, zipcode;
select state, zipcode, count(purchase_id) 
from purchases 
group by state, zipcode;

-- 2. [Group by using a HAVING filter]:
-- SELECT state, COUNT(id) FROM purchases
--                                      GROUP BY state
--                                      HAVING COUNT(id) > 100;
SELECT state, COUNT(purchase_id) FROM purchases
GROUP BY state
HAVING COUNT(purchase_id) > 100;

-- 3. [Multiple-value subquery]: SELECT * FROM purchases WHERE
--            user_id IN
--            (SELECT user_id FROM users WHERE email LIKE '%@gmail.com');
SELECT * FROM purchases WHERE
user_id IN
(SELECT user_id FROM users WHERE email LIKE '%@gmail.com');

-- 4. [Using alias in filter]: SELECT name, email FROM users AS u
--            JOIN purchases AS p ON p.user_id=u.user_id
--            WHERE u.email LIKE '%@gmail.com';
SELECT name, email FROM users AS u
INNER JOIN purchases AS p ON p.user_id = u.user_id
WHERE u.email LIKE '%@gmail.com';
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Find the most recent purchase made by each user.
select name, max(created_at)
from purchases
group by name;

-- 3. Find the oldest purchase made by a user with a verizon email
--    address.
select * from purchases 
where user_id in (select user_id from users
where email like '%@verizon.com')
order by created_at
limit 5;

-- 4. Find all the users' emails who made at least one purchase from the
--    state of NY.
select * from users where exists
(select 1 from purchases where purchases.user_id = users.user_id
end state = 'NY')
----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. Use the DATEPART() function to find the number of users created
--    during each day of the week.
--    Hint: Use DW as the first input
select date_part('dow',created_at) as day, count(*) from users
group by date_part()
-- 2. How about each day of the month?















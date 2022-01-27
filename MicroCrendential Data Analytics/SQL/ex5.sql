-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Join]: select name, email from purchases join users on purchases.user_id = users.id
select name, email from purchases 
join users on purchases.user_id = users.user_id;

-- 2. [Same join using aliases]: select name, email from users as u join purchases as p on p.user_id=u.id
select name, email from users as u join purchases as p on p.user_id=u.user_id;

-- 3. [Using alias in filter]: select name, email from users as u join purchases as p on p.user_id=u.id where u.email like '%gmail.com'
select name, email from users as u join purchases as p on p.user_id=u.user_id where u.email like '%gmail.com'
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Join the purchases and purchase_items tables, on purchases.id and purchase_items.purchase_id
select name, email from purchases join purchase_items on purchase.purchase_id = purchase_items.purchase_id

-- 2. Modify the last query, aliasing purchases as p and purchase_items as pi.
select * from purchases as p join purchase_items as pi on p.purchase.id = pi.purchase_id; 

-- 3. Using the same join, perform a group by to sum the total quantity of items purchased under each user_id.
select user_id, sum(quantity)
from purchase p join purchase_items pi
on p.purchase_id = pi.purchase_id 
group by user_id;

-- 4. Using the same join, find the average purchase amount from each state.
select state, avg(price * quantity)from purchases as p join purchase_items as pi 
on p.purchase_id=pi.purchase_id group by state order by state;

-- 5. Join the purchases and users tables, using an alias for each table.
select * from purchases p join users u 
on p_user.id = u_user.id;

-- 6. Using the above join, filter to just the orders with an Gmail email address OR a buyer named 'Clay'
select * from purchases p join users u 
on p_user.id = u.user.id
where email like '%@gmail.com' or name like 'CLAY %';
----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. Joins can combine more than two tables. Join the users table,  purchases table, and purchase items table. Remember to use aliases.
select * from purchases as p 
join users AS u on p.user_id = u.user_id
join purchase_items AS pi on p.purchase_id = pi.purchase_id;

-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Grouping by one column]: select state, count(id) from purchases group by state;
select state, 
count(user_id) 
from purchases group by state;

-- 2. [Grouping by multiple columns]: select state, zipcode, count(id) from purchases group by state, zipcode;
select state, zipcode,
count(purchase_Id) 
from purchases 
group by state, zipcode;
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. Find the most recent purchase made within each state.
select state, max(created_at)
from purchases
group by state;

-- 2. Use the purchase_items table to find the total number of each product_id sold.
select count(product_id), product_id 
from purchase_items
group by product_id
order by product_id; 

-- 3. Use the purchase_items table to see the total dollar amount of items in each state: Delivered, Returned, Pending
select status, sum(price*quantity)
from purchase_items
group by status;

-- 4. In the products table, find how many products are under each set of tags.
select tags, count(*)
from products
group by tags;

-- 5. Modify the previous query to find how many products over $10 are under each set of tags.
select tags, count(*)
from products
where price > 10
group by tags;

-- 6. Use the user table to find out how many purchases each user made.
select user_id, count(*)
from purchases
group by user_id;

-- 7. What is the first purchase that was made in each state, in each zipcode? (No, zipcodes do not repeat between states, but write your query as though they did.)
select state, zipcode, min(created_at)
from purchases
group by state, zipcode;

----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. The DATEPART() function extracts whichever part of the
--  timestamp you want. E.g. DATEPART(year FROM '2001-02-16 20:38:40')
--  returns 2001. Use DATEPART() to extract which calendar month
--  each user was created in.
select user_id, date_part('month', created_at) as month
from users;

-- 2. Use DATEPART() and a group by statement to count how many
--    users were created in each calendar month.
select date_part('month', created_at), count(*)
from users
group by date_part('month', created_at);

-- 3. Use the DATEPART() function to find the number of users
--    created during each day of the week.
--    Hint: Use DAY as the first input
select date_part('dow', created_at), count(*)
from users
group by date_part('dow', created_at);



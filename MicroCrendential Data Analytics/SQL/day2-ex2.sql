-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Inner Join]: SELECT *
--                  FROM users AS u
--                  JOIN purchases AS p
--                  ON p.user_id=u.id;
SELECT * FROM users AS u
JOIN purchases AS p
ON p.user_id=u.user_id;

-- 2. [Left Join]: SELECT *
--                 FROM users AS u
--                 LEFT JOIN purchases AS p
--                 ON p.user_id=u.id;
SELECT * FROM users AS u
LEFT JOIN purchases AS p
ON p.user_id=u.user_id;

-- 3. [Finding NULLS]: SELECT *
--                     FROM users AS u
--                     WHERE details IS NULL;
SELECT * FROM users AS u
WHERE u.email IS NULL;

--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 1. First, join the products table to the purchase_items
--    table. Choose a join that will KEEP products even
--    if they don't have any associated purchase_items.
SELECT * FROM 
products pr
LEFT JOIN purchase_items pu
ON pr.product_id=pu.product_id;

-- 2. Were there any products with no purchase?
--    Query the joined table for rows with NULL quantity.
-- SELECT * FROM 
-- products pr
-- LEFT JOIN purchase_items pu
-- ON pr.product_id=pu.product_id;
-- WHERE quantity is null; 

-- 3. Now add a groupby to find the average quantity that
--    each product was purchased in.
-- select product_id, avg(quantity)
-- from products pr 
-- left outer join purchase_items pu
-- on pr.product_id = pu.product_id 
-- group by pr.product_id;

-- 4. Let's find the total number of items associated with each
--    user.
select * 
from purchases p 
inner join purchase_items pi 
on p.purchase_id = pi.purchase_id;

-- a. First, join the purchases and purchase_items table,
--    so we have both user_id and quantity.
--    Which kind of join is appropriate here?


-- b. Now use a group by to find the total quantity for each
--    user_id.
select user_id, sum(quantity)
from purchases p 
inner join purchases_items pi 
on p.purchases_id = pi.purchases_item
group by user_id; 






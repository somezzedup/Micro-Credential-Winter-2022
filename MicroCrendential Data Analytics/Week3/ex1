------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------

-- 1. [Distinct values in column]: SELECT DISTINCT price FROM products;
select * from products;
select distinct tags from products;

-- 2. [Filter using set of values]: SELECT * FROM products WHERE price IN (5.99, 9.99);
select * from purchases;
select * from purchases where state in ('VA', 'WI');
-- 3. [Filter with wildcard]: SELECT * FROM products WHERE title LIKE '%Book%;
select * from purchases where name like '%Book%';
-- 4. [Less-than filter and order by]: SELECT * FROM products WHERE price < 10 ORDER BY price DESC;
select count(*) from products where price < 10;
--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------

-- 1. Find how many distinct sets of tags there are in the products table.
select * from products;
select distinct tags from products;

-- 2. Find all the rows of purchases made from either Virginia (VA) or Wisconsin (WI).
select * from purchases;
select * from purchases where state in ('VA', 'WI');

-- 3. Find all the rows of the purchases made by people with the first name of "Johnathan".
select * from purchases where name like 'Jonathan %';

-- 4. How many purchases were made by people whose last name starts with an 'A'?
select * from purchases where name like '% A%';

-- 5. How many products cost between $10 and 30?
select count(*) from products where 10 <= price and price <= 30;

-- 6. What is the average price among Returned items, from the purchase_items table?
select * from purchase_items;
select distinct status from purchase_items;
select avg(price) from purchase_items where status = 'Returned';

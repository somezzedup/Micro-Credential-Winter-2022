-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Union Join]: SELECT email, id FROM users
--                  UNION
--                  SELECT title, price FROM products;
SELECT email, user_id FROM users
UNION
SELECT title, price FROM products;

-- 2. [Conditional]: SELECT title,
--                     CASE WHEN (price < 100)
--                     THEN 'cheap'
--                     ELSE 'expensive'
--                   END FROM products;

select title,
case when (price <100)
then 'cheap'
else 'expensive'
end from products;

--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 0. Select all the names associated with purchases made after
--    2010-01-01,
--    and all the emails associated with users made after 2010-01-01.
select name, created_at from purchases
where created_at > '2010-01-01'
union all
select email, created_at from users
where created_at > '2010-01-01'
order by created_at;

-- 1. Write a conditional that will categorize each purchase as
--    'West Coast' (if it
--    was ordered from CA, OR, or WA) or 'Other'
select state, case 
	when (state in ( 'CA' ,'OR', 'WA'))
	then 'West Coast'
	else 'Other'
end 
from purchases;

-- 2. Modify the last query with a group by statement, to find
--    the number of purchases among West Coast states vs Others.
select  count(state),
case when (state like 'CA' or state like 'OR' or state like  'WA')
then 'West Coast'
else 'Other'
end from purchases 
group by case when (state like 'CA' or state like 'OR' or state like 'WA')
then 'West Coast'
else 'Other'
end;

select count(*)

-- 3. Write a conditional to divide users into three groups, based on
--    their created_at:
--    early for before 2009-06-01,
--    majority for between 2009-06-01 and 2010-01-01
--    late for after 2010-01-01
select created_at,
case 
when created_at < '2009-06-01' then 'early'
when created_at > '2010-01-01' then 'late'
else 'majority'
end from users
order by created_at;

-- 4. Modify the last query by adding a join against the purchases
--    table.
--    Note: Since created_at exists in both tables, you'll need to
--    prefix with the table name (e.g users.created_at)
-- select created_at as u.created_at,
-- case 
-- when created_at < '2009-06-01' then 'early'
-- when created_at > '2010-01-01' then 'late'
-- else 'majority'
-- end 
-- from users as u
-- join purchases as p on u.created_at = p.created_at;

-- 5. Add a groupby statement to find which group of customers makes
--    more purchases: early, majority, or late.
select case when (u.created_at < '2009-06-01') then 'early')
			when (u.created_at > '2009-06-01') then 'late')
			else 'late'
		end as user_type,
		count(*)
from users as u
join purchases as p
on u.user_id = p.user_id
group by case when (u.created_at < '2009-06-01') then 'early')
			when (u.created_at > '2009-06-01') then 'late')
			else 'late'
			end;
----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. Use DATEPART() and a conditional to categorize purchases as
--    'weekday' and 'weekend'.
--    Hint: DATEPART(DW, column) outputs day of week as a number
--    with Sunday as 0, Saturday as 6.
-- 2. Group by state and weekday/weekend to see the number of weekday
--    weekend purchases per state.


select  count(state),
case when (state like 'CA' or state like 'OR' or state like  'WA')
then 'West Coast'
else 'Other'
end from purchases 
group by case when (state like 'CA' or state like 'OR' or state like 'WA')
then 'West Coast'
else 'Other'
end;

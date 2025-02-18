CREATE DATABASE `sql_store`

USE `sql_store`

SELECT * FROM `order_item_notes`

-- using the store db.

USE `store`

-- show all customers
SELECT * FROM `customers`


-- return all products and show name, unit prince, new price (price * 10%)
SELECT `name`, `unit_price`, unit_price * 1.1 as `new_price` FROM `products`

-- show customers with points less than 500
SELECT `points` FROM customers WHERE `state` != "fl"

-- show orders that ordered this year

SELECT * FROM `orders` WHERE `order_date` < CURRENT_DATE 

-- from order_items get the 6 order

SELECT * FROM `order_items` WHERE `order_id` = 6

SELECT * FROM `order_items` WHERE `unit_price` * `quantity` > 30 AND order_id = 6



--! ============== in operator: used in arrays & enums =============

SELECT * FROM `customers` WHERE `state` not IN("fl","tx")

SELECT * FROM `products` WHERE quantity_in_stock IN(49,38,72)


--! ============ between operator: used for ranges ===============================

SELECT * FROM `customers` WHERE points BETWEEN 1000 AND 3000

SELECT * FROM `customers` WHERE `birth_date` BETWEEN "1990-01-01" AND "2000-01-01"


--! ======================= like operator: to match pattern =================

-- get all customers their name start with b

SELECT * FROM customers WHERE `last_name` LIKE "b%"


-- get all customers their name ends with y
SELECT * FROM customers WHERE `last_name` LIKE "%y"

-- get all customers their name contain  b

SELECT * FROM customers WHERE `last_name` LIKE "%b%"

-- you can us _ to math one character like _y -> oy, __y -> boy

-- get all customers with trail or avenue in their address
SELECT * FROM `customers` WHERE `address` LIKE "%trail%" or  `address` LIKE "%avenue%"

-- where number ends with 9
SELECT * FROM `customers` WHERE `phone` LIKE "%9%" 


--! ============= we can use the REGEX as well to the same task =======

SELECT * FROM `customers` WHERE `last_name` REGEXP "(ag)e"

-- first name is elka ambur

SELECT * FROM `customers` WHERE `first_name` REGEXP "^elka|^ambur"

-- last name ends with ey or on

SELECT * FROM `customers` WHERE `last_name` REGEXP "ey$|on$"

-- last name start with my or contain se
SELECT * FROM `customers` WHERE `last_name` REGEXP "^my|se"

-- contain b followed by r or u
SELECT * FROM `customers` WHERE `last_name` REGEXP "b[r|u]"



--! =============== is null: check cols contain null value ================



SELECT * FROM `customers` WHERE `phone` IS NULL or `first_name` is NULL

-- get all orders not shipped

SELECT * FROM `orders` WHERE `status` IS NOT NULL and `comments` IS NOT NULL

-- ===========

SELECT `order_id`, `product_id`, `quantity`, `unit_price` FROM `order_items` WHERE `order_id` = 2 ORDER BY "unit_price"


SELECT * FROM `customers` ORDER BY points DESC LIMIT 3

--TODO ===================== INNER JOINS ==========================

-- 2 two types of joint {inner/outer}

SELECT `order_id`, `status`, orders.customer_id, customers.last_name
 FROM `orders`
  JOIN store.customers
     ON orders.customer_id = store.customers.customer_id

-- self inner joints

USE sql_hr

SELECT e.first_name, e.last_name,e.employee_id, m.first_name, m.employee_id
  FROM employees e
   JOIN  employees m
     on e.reports_to = m.employee_id 

-- multiple joining

USE store

SELECT o.order_id, o.customer_id, os.order_status_id, s.first_name, os.name
 FROM orders o 
    JOIN store.order_statuses os
         on o.status = os.order_status_id 
            JOIN store.customers s 
                on o.customer_id = s.customer_id



--? ======================================================

-- composite join is when you use a table contain more than on primary ket to identify a record
-- you need to JOIN ON all primary keys with wanted table
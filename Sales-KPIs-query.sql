-- -- Create a new database called 'PizzaDB'
-- -- Connect to the 'master' database to run this snippet
-- USE master
-- GO
-- -- Create the new database if it does not exist already
-- IF NOT EXISTS (
--     SELECT [name]
--         FROM sys.databases
--         WHERE [name] = N'PizzaDB'
-- )
-- CREATE DATABASE PizzaDB
-- GO

-- To view the data
SELECT * FROM pizza_sales;

-- for the first we have Total Revenue
SELECT SUM(total_price) AS Total_Revenue from pizza_sales;

-- Avg order Val

SELECT SUM(total_price) /COUNT(DISTINCT order_id) AS Avg_order_Value from pizza_sales;

-- Total Pizza sold

SELECT SUM(quantity) FROM pizza_sales;

-- Total Orders
SELECT COUNT(distinct order_id) AS Total_order FROM pizza_sales;

-- Avg Pizza per order

SELECT CAST(CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT order_id)AS decimal(10,2)) AS decimal(10,2)) from pizza_sales

SELECT SUM(quantity) from pizza_sales
SELECT count(DISTINCT order_id) from pizza_sales

-- For hourly trend

SELECT DATEPART(HOUR,order_time) as Hour , 
SUM(quantity) AS Pizza_Sold  
from pizza_sales
WHERE DATEPART(HOUR,order_time) BETWEEN 12 AND 13
GROUP by DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time) DESC

-- For the weekely trend

SELECT DATEPART(ISO_WEEK, order_date) AS Order_Week,  
COUNT(distinct order_id) AS Number_order
from pizza_sales
GROUP BY DATEPART(ISO_WEEK, order_date)
ORDER BY COUNT(distinct order_id) DESC

-- Percentage of Sales By Pizza Category
SELECT pizza_category,
CAST(SUM(total_price) AS decimal(10,2)) AS Total_revenue,
CAST(CAST(SUM(total_price) *100 AS decimal(10,2)) / CAST((SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS decimal(10,2)) AS PTE
FROM pizza_sales
GROUP BY pizza_category
HAVING CAST(CAST(SUM(total_price) *100 AS decimal(10,2)) / CAST((SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS decimal(10,2)) < 24
order by CAST(CAST(SUM(total_price) *100 AS decimal(10,2)) / CAST((SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS decimal(10,2)) 

-- Percentage of sales by pizza size
SELECT pizza_size,
CAST(SUM(total_price) AS decimal(10,2)) AS Total_revenue,
CAST(CAST(SUM(total_price) *100 AS decimal(10,2)) / CAST((SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS decimal(10,2)) AS PTE
from pizza_sales
where pizza_size = 'M'
GROUP by pizza_size 
order by pizza_size

-- TOTAL PIZZA SOLD BY CATEGORY

SELECT pizza_category,
SUM(quantity) As Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY SUM(quantity) DESC

-- Top 5 pizza by revenue

select TOP 5 pizza_name,
CAST(SUM(total_price) AS DECIMAL(10,2)) as Revenue 
from pizza_sales
GROUP by pizza_name
order by SUM(total_price) DESC

-- Bottom 5 pizza by revenue

select pizza_name,
CAST(SUM(total_price) AS DECIMAL(10,2)) as Revenue 
from pizza_sales
GROUP by pizza_name
order by SUM(total_price) ASC

-- Top 5 pizza by quantity
SELECT top 5 pizza_name,
SUM(quantity) AS QUANTIY
from pizza_sales
GROUP BY pizza_name
ORDER by SUM(quantity) DESC

-- Bottom 5 pizza by quantity

SELECT pizza_name,
SUM(quantity) AS QUANTIY
from pizza_sales
GROUP BY pizza_name
ORDER by SUM(quantity) ASC

-- Top 5 pizzas by total order
SELECT Top 5 pizza_name,
COUNT(DISTINCT order_id)
FROM pizza_sales
GROUP BY pizza_name
ORDER BY COUNT(DISTINCT order_id) DESC

-- Bottom 5 pizza

SELECT TOP 5  pizza_name,
COUNT(DISTINCT order_id)
FROM pizza_sales
GROUP BY pizza_name
ORDER BY COUNT(DISTINCT order_id) ASC
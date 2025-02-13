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

-- For the weekely trend

-- Exploring all the columns in the Gamezone Database
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'orders';

-- Dimension Exploration

-- What are the different countries from which Gamezone has made sales from?
SELECT DISTINCT country_code,region
FROM orders 
JOIN regions
ON orders.country_code=regions.country
GROUP BY country_code, region
ORDER BY 1;

-- What products have been offered by Gamezone?
SELECT DISTINCT product_name
FROM orders;

-- What are the different marketing channels through which customers have been acquired?
SELECT DISTINCT marketing_channel
FROM orders;

-- What are the various account creation methods?
SELECT DISTINCT account_creation_method
FROM orders;

-- Exploring purchase platforms offered by Gamezone
SELECT DISTINCT purchase_platform
FROM orders;


-- Date Exploration

-- Finding the dates of the first and last purchase and how many years of sales are available?
SELECT 
MIN(purchase_ts) AS first_purchase_date,
MAX(purchase_ts) AS last_purchase_date,
EXTRACT(YEAR FROM MAX(purchase_ts)) - EXTRACT(YEAR FROM MIN(purchase_ts)) AS year_range
FROM orders;

SELECT 
MIN(ship_ts) AS first_ship_date,
MAX(ship_ts) AS last_ship_date,
EXTRACT(YEAR FROM MAX(ship_ts)) - EXTRACT(YEAR FROM MIN(ship_ts)) AS year_range
FROM orders;


-- Exploring measures

-- What is the total sales acquired?
SELECT SUM(usd_price) AS total_sales
FROM orders;

-- What is the average sale price?
SELECT ROUND(AVG(usd_price),2) AS avg_sale_price
FROM orders;

-- What is the total number of orders?
SELECT COUNT(order_id)
FROM orders;

SELECT COUNT(DISTINCT order_id)
FROM orders;

-- Total no of products sold
SELECT COUNT(DISTINCT product_name)
FROM orders;

-- Total no of customers that have placed orders
SELECT COUNT(DISTINCT user_id)
FROM orders;

-- Exploring measures by categories

-- Total Sales by region
SELECT SUM(usd_price) AS total_sales, region
FROM orders JOIN regions
ON orders.country_code = regions.country
GROUP BY region
ORDER BY SUM(usd_price) DESC;

-- Total Sales by product
SELECT SUM(usd_price) AS total_sales, product_name
FROM orders
GROUP BY product_name
ORDER BY SUM(usd_price) DESC;

-- Total Sales by marketing channel
SELECT SUM(usd_price) AS total_sales, marketing_channel
FROM orders
GROUP BY marketing_channel
ORDER BY SUM(usd_price) DESC;

-- Total count of products 
SELECT product_name, COUNT(product_name)
FROM orders
GROUP BY product_name;

-- product popularity by sales
SELECT product_name,SUM(usd_price) AS total_sales,
ROW_NUMBER() OVER (ORDER BY SUM(usd_price) DESC) AS popularity
FROM orders
GROUP BY product_name;


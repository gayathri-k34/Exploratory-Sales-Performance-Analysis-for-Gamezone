-- creating the orders table

CREATE TABLE IF NOT EXISTS orders(
USER_ID VARCHAR(50),
ORDER_ID VARCHAR(120),
PURCHASE_TS DATE,
SHIP_TS DATE,
PRODUCT_NAME VARCHAR(50),
PRODUCT_ID VARCHAR(10),
USD_PRICE NUMERIC(8,2),
PURCHASE_PLATFORM VARCHAR(20),
MARKETING_CHANNEL VARCHAR(50),
ACCOUNT_CREATION_METHOD VARCHAR(50),
COUNTRY_CODE VARCHAR(5)
);

-- creating the regions table
CREATE TABLE IF NOT EXISTS regions(
COUNTRY VARCHAR(50),
REGION VARCHAR(50)
);

-- DATA CLEANING

SELECT *
FROM orders;

SELECT * 
FROM regions;

-- removing duplicate rows
SELECT *,
ROW_NUMBER() OVER(PARTITION BY user_id, order_id,purchase_ts, ship_ts,product_name,product_id,usd_price,purchase_platform, marketing_channel, account_creation_method,country_code) AS row_num
FROM orders;

WITH duplicates_cte AS (
  SELECT ctid,
         ROW_NUMBER() OVER (
           PARTITION BY user_id, order_id, purchase_ts, ship_ts,
                        product_name, product_id, usd_price,
                        purchase_platform, marketing_channel,
                        account_creation_method, country_code) AS row_num
  FROM orders)
DELETE FROM orders
WHERE ctid IN (
  SELECT ctid
  FROM duplicates_cte
  WHERE row_num > 1
);

-- Standardizing data
-- inconsistent product names
SELECT DISTINCT product_name, COUNT(*)
FROM orders
GROUP BY product_name;

SELECT *
FROM orders
WHERE product_name LIKE '27in 4k gaming monitor%';

UPDATE orders
SET product_name = '27in 4K gaming monitor'
WHERE product_name LIKE '27in 4k gaming monitor%';

SELECT DISTINCT marketing_channel
FROM orders;

SELECT DISTINCT COUNTRY_CODE
FROM orders
ORDER BY 1;

SELECT *
FROM orders;


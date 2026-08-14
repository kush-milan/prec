create database prectics;
-- CREATE DATABASE IF NOT EXISTS prectics;
-- USE prectics;

CREATE TABLE prec (
    order_id INT PRIMARY KEY,
    order_date VARCHAR(20),
    customer_id INT,
    product_category VARCHAR(30),
    region VARCHAR(20),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    payment_method VARCHAR(20),
    delivery_days INT,
    customer_rating DECIMAL(3,1),
    revenue DECIMAL(12,2)
);

DROP TABLE IF EXISTS prec;

select *from prectics.prec;
select count(Order_id) as Total_application
from prec;

-- ALTER TABLE prec
-- ADD COLUMN Order_dt date;

-- UPDATE prec
-- SET order_dt = STR_TO_DATE(order_date,'%d-%m-%Y')
-- WHERE order_id IS NOT NULL;

-- Q1 Total revenue
select sum(revenue) as Total_Revenue
from prec;

-- Q2 highest use payment mothod 
select
 payment_method ,
 sum(revenue) as Total_revenue
from prec
group by payment_method 
Order by  total_revenue DESC
LIMIT 3;

-- Q3 Product category with Highest revenue

select product_category, 
sum(revenue) as total_revenue
from prec
Group by product_category
Order by total_revenue  DESC
LIMIT 4;


-- Q4 Product Category with  Highset Discount and total revenue

select product_category,
max(discount) as highest_discount,
sum(revenue) as total_revenue
from prec
group by product_category
ORDER BY highest_discount DESC , total_revenue DESC
LIMIT 2; 

-- Q5 Customer_id with product_category and product highest customer_rating


SELECT
    customer_id,
    COUNT(product_category) AS total_products,
    MAX(customer_rating) AS highest_rating
FROM prec
GROUP BY customer_id
ORDER BY total_products DESC, highest_rating DESC
LIMIT 4;


-- Q6 product category with highest customer_rating

SELECT
    product_category,
    MAX(customer_rating) AS highest_rating
FROM prec
GROUP BY product_category
ORDER BY highest_rating DESC
LIMIT 3;

select *from prec;











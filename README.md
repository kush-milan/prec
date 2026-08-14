# 🛒 PREC 2 Retail Sales Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing retail sales data using SQL to uncover valuable business insights.
The analysis helps understand customer purchasing behavior, product performance, revenue generation, discounts, payment preferences, and customer satisfaction.
The project demonstrates practical SQL skills through real-world business questions and data analysis.


## 🎯 Objectives

* Analyze total sales revenue.
* Identify the most used payment methods.
* Find top-performing product categories.
* Analyze discounts across product categories.
* Identify top revenue-generating customers.
* Evaluate customer ratings and satisfaction.
* Generate business insights using SQL.

---

## 🛠️ Tools & Technologies

* MySQL
* SQL
* MySQL Workbench
* Kaggle Dataset
* GitHub

## 📂 Dataset
[Data set](https://github.com/kush-milan/prec/blob/main/prec2.csv)
The dataset was sourced from Kaggle and contains retail sales transaction data.


## 🗄️ Database Schema

```sql
CREATE TABLE prec (
    order_id INT,
    order_date DATE,
    customer_id INT,
    product_category VARCHAR(20),
    region VARCHAR(20),
    quantity INT,
    unit_price INT,
    discount INT,
    payment_method VARCHAR(23),
    delivery_days INT,
    customer_rating INT,
    revenue INT
);
```

---

## 📊 Business Questions Solved


-- Q1 What is the total revenue generated from all sales transactions
```sql
select sum(revenue) as Total_Revenue
from prec;
```

-- Q2 Which payment methods generate the highest revenue?
```sql

select
 payment_method ,
 sum(revenue) as Total_revenue
from prec
group by payment_method 
Order by  total_revenue DESC
LIMIT 3;
```

-- Q3 Which product categories contribute the most revenue?
```sql

select product_category, 
sum(revenue) as total_revenue
from prec
Group by product_category
Order by total_revenue  DESC
LIMIT 4;

```
-- Q4 Which product categories receive the highest discounts and how much revenue do they generate?
```sql

select product_category,
max(discount) as highest_discount,
sum(revenue) as total_revenue
from prec
group by product_category
ORDER BY highest_discount DESC , total_revenue DESC
LIMIT 2; 

```
-- Q5 Which customers purchase the most products and provide the highest ratings?

```sql
SELECT
    customer_id,
    COUNT(product_category) AS total_products,
    MAX(customer_rating) AS highest_rating
FROM prec
GROUP BY customer_id
ORDER BY total_products DESC, highest_rating DESC
LIMIT 4;
```

-- Q6 Which product categories receive the highest customer ratings?
```sql
SELECT
    product_category,
    MAX(customer_rating) AS highest_rating
FROM prec
GROUP BY product_category
ORDER BY highest_rating DESC
LIMIT 3;

```

## 📈 Key Insights

* Identified the most preferred payment method.
* Determined the highest revenue-generating product category.
* Evaluated discount impact across product categories.
* Identified top customers based on revenue contribution.
* Analyzed customer satisfaction using ratings.
* Generated actionable business insights using SQ

## 📚 Learning Outcomes

Through this project, I gained hands-on experience in:

* Writing SQL queries for business analysis
* Working with real-world datasets
* Data aggregation and reporting
* Customer and revenue analytics
* Generating business insights from raw data

---

## 👨‍💻 Author

### Milan Kumar

Aspiring Data Analyst

**Skills:** SQL | Power BI | Python | Excel | Data Analytics

GitHub: https://github.com/kush-milan

---

## ⭐ Support

If you found this project useful, consider giving it a star and exploring more projects on my GitHub profile.

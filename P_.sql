SELECT * FROM dbo.ecommerce_data


UPDATE dbo.ecommerce_data
SET total_amount = sales_per_order*order_quantity+ profit_per_order-order_item_discount;

---1. Total sales amount for each product:---

SELECT product_name, SUM(total_amount) AS total_sales
FROM dbo.ecommerce_data
GROUP BY product_name;

---2.Total sales amount for each month:---

SELECT MONTH(order_date) AS month, SUM(total_amount) AS total_sales
FROM dbo.ecommerce_data
GROUP BY MONTH(order_date);

---3.Total sales amount for each year:---
SELECT YEAR(order_date) AS year, SUM(total_amount) AS total_sales
FROM dbo.ecommerce_data
GROUP BY YEAR(order_date);

---4.Top-selling products by quantity:---
SELECT product_name, SUM(sales_per_order) AS total_quantity
FROM dbo.ecommerce_data
GROUP BY product_name
ORDER BY total_quantity DESC;

---5.Average sales amount per month:---
SELECT MONTH(order_date) AS month, AVG(total_amount) AS average_sales
FROM dbo.ecommerce_data
GROUP BY MONTH(order_date);

---6.Monthly sales trend:---
SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(total_amount) AS total_sales
FROM dbo.ecommerce_data
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

---7.Total sales amount for each customer:---
SELECT customer_first_name, SUM(total_amount) AS total_sales
FROM dbo.ecommerce_data
GROUP BY customer_first_name;

---8.Sales performance comparison between different regions:---
SELECT customer_region, SUM(total_amount) AS total_sales
FROM dbo.ecommerce_data
GROUP BY customer_region;








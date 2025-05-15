analysis.sql

1)-- Top 5 Spending Customers
select c.customer_id,c.name,sum(o.total_amount) as Total_spent
from customers c
join orders o on c.customer_id=o.customer_id
Group by c.customer_id, c.name
order by Total_spent DESC
limit 5;

2)-- Monthly Revenue in 2024
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(total_amount) AS total_revenue
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY month;

3)--Most Popular Product Categories (by Units Sold)
SELECT 
  p.category, 
  SUM(o.quantity) AS total_unit_sold
FROM products p
JOIN order_items o ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY total_unit_sold DESC
LIMIT 3;

4)--Top-Selling Products by Revenue

SELECT o.product_id, SUM(o.quantity * o.price) AS Total_revenue
FROM order_items o
JOIN products p ON o.product_id = p.product_id
GROUP BY o.product_id
ORDER BY Total_revenue DESC
LIMIT 5;

or

SELECT p.name AS product_name, SUM(o.quantity * o.price) AS Total_revenue
FROM order_items o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.name
ORDER BY Total_revenue DESC
LIMIT 5;

5)--Monthly order count and revenue side by side?

SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  COUNT(order_id) AS order_count,
  SUM(total_amount) AS total_revenue
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY month
ORDER BY month;




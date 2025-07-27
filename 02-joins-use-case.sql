-- Lecture 2 SQL Practice: INNER JOIN and LEFT JOIN
-- Refer `dummy01.sql` to create the tables before running the following code

-- INNER JOIN: Customers who placed orders
SELECT c.name, o.product
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN: All customers, with orders if they exist
SELECT c.name, o.product
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

--Keep Improving! 

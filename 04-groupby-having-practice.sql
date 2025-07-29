-- Lecture 4 SQL Examples: GROUP BY and HAVING

-- Example 1: Count how many orders each customer made
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

-- Example 2: Show only those customers who made more than one order
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Example 3: Count number of unique products each customer ordered
SELECT customer_id, COUNT(DISTINCT product) AS unique_products
FROM orders
GROUP BY customer_id;

-- Additional Practice Example 1: Show customers with more than two different products ordered
SELECT customer_id, COUNT(DISTINCT product) AS unique_products
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT product) > 2;

-- Additional Practice Example 2: Total number of orders per product
SELECT product, COUNT(*) AS total_orders
FROM orders
GROUP BY product;

-- Additional Practice Example 3: Products ordered more than 3 times
SELECT product, COUNT(*) AS total_orders
FROM orders
GROUP BY product
HAVING COUNT(*) > 3;

-- Have fun practicing!!

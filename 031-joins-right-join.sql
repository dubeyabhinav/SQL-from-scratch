-- Lecture 3.1: RIGHT JOIN Example using dummy01 dataset

-- This script assumes you have already created and populated the 'customers' and 'orders' tables as shown in dummy01 dataset

-- Example 1: RIGHT JOIN
-- This query selects all orders, including those that don't have a matching customer.
-- The customers table is on the left, and the orders table is on the right.
-- All records from the orders table are retained.
-- If an order's customer_id doesn't match any customer, the customer fields will be NULL.

SELECT c.customer_id, c.name, o.order_id, o.product
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- Interpretation:
-- Orders with customer_id 116, 117, 118, and 121 do not have a matching customer in the customers table.
-- Still, they appear in the output with customer fields (customer_id, name) as NULL.
-- This is useful when we want to analyze all orders, even the ones from unregistered or invalid customers.

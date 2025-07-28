-- Lecture 3.2: FULL OUTER JOIN Example using dummy01 dataset

-- This script assumes you have already created and populated the 'customers' and 'orders' tables as shown in dummy01 dataset

-- Example 2: FULL OUTER JOIN (simulated using UNION of LEFT and RIGHT JOINs)
-- MySQL does not support FULL OUTER JOIN natively, so we combine LEFT and RIGHT JOINs using UNION.
-- This gives us all records from both tables, with NULLs wherever matches are not found.

SELECT c.customer_id, c.name, o.order_id, o.product
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.name, o.order_id, o.product
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- Interpretation:
-- This UNION query includes:
-- 1. All customers with their orders (if any)
-- 2. All orders even if they don’t have a valid customer
-- For more explanation refer `README.md`.

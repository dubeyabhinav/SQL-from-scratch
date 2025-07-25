-- INNER JOIN: Get customers who placed orders
SELECT c.cust_id, c.name, o.order_id
FROM customers AS c
INNER JOIN orders AS o
  ON c.cust_id = o.cust_id;

-- LEFT JOIN: Get all customers, even if there are no orders
SELECT c.cust_id, c.name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
  ON c.cust_id = o.cust_id;

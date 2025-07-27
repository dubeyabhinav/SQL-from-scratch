-- Run this query to get yourself a dummy dataset 
-- Create the tables 
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50)
);

-- Populate the tables
-- each table has 20 values

INSERT INTO customers (customer_id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana'),
(5, 'Ethan'),
(6, 'Fiona'),
(7, 'George'),
(8, 'Hannah'),
(9, 'Ian'),
(10, 'Julia'),
(11, 'Kevin'),
(12, 'Laura'),
(13, 'Mason'),
(14, 'Nina'),
(15, 'Oscar'),
(16, 'Priya'),
(17, 'Quinn'),
(18, 'Ravi'),
(19, 'Sara'),
(20, 'Tom');

INSERT INTO orders (order_id, customer_id, product) VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mouse'),
(103, 3, 'Keyboard'),
(104, 3, 'Monitor'),
(105, 5, 'Tablet'),
(106, 6, 'Headphones'),
(107, 8, 'Charger'),
(108, 10, 'Camera'),
(109, 11, 'SSD'),
(110, 13, 'Phone'),
(111, 15, 'Speaker'),
(112, 16, 'Laptop Stand'),
(113, 17, 'Power Bank'),
(114, 17, 'USB Cable'),
(115, 19, 'Router'),
(116, 21, 'Mousepad'),     
(117, 22, 'Game Console'), 
(118, 0, 'HDMI Cable'),    
(119, 5, 'Webcam'),
(120, 6, 'Printer'),
(121, 100, 'Tripod');      

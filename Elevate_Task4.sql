CREATE DATABASE elevate_lab;
USE elevate_lab;

-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO Customers (customer_id, name, country) VALUES
(1, 'John Smith', 'USA'),
(2, 'Priya Gupta', 'India'),
(3, 'Ali Khan', 'UAE'),
(4, 'Maria Lopez', 'Spain'),
(5, 'David Lee', 'Singapore');

-- 2. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2024-06-01', 250),
(102, 2, '2024-06-02', 300),
(103, 1, '2024-06-05', 150),
(104, 3, '2024-06-07', 400),
(105, 4, '2024-06-10', 100);

-- 3. Order_Items Table
CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Order_Items (item_id, order_id, product_name, quantity, price) VALUES
(1, 101, 'Laptop', 1, 250),
(2, 102, 'Phone', 1, 300),
(3, 103, 'Mouse', 1, 150),
(4, 104, 'Tablet', 2, 200),
(5, 105, 'Charger', 1, 100);

-- This Command Shows Name With Help Of WHERE clause.
SELECT * FROM Customers
WHERE Country = 'India';

-- This Command Shows Country Descending Order (This Command Sorted Bottom To Top).
SELECT * FROM Customers
ORDER BY country DESC;

-- This Command Shows Count, Sum With Help Group BY.
SELECT country, COUNT(country) AS countpeople FROM customers
GROUP BY country;

SELECT order_id, SUM(total_amount) AS Total_sales FROM Orders
GROUP BY order_id;


-- This All LEFT, RIGHT, INNER JOIN.
SELECT c.customer_id, c.name, c.country, o.total_amount
FROM customers c
LEFT JOIN Orders o 
ON c.customer_id = o.order_id;


SELECT c.customer_id, c.name, c.country, o.total_amount
FROM customers c
LEFT JOIN Orders o 
ON c.customer_id = o.order_id;

SELECT o.total_amount, o.order_id, c.country
FROM customers c
RIGHT JOIN Orders o 
ON c.customer_id = o.order_id ;

SELECT o.total_amount, o.order_id, c.country, oi.price
FROM customers c
INNER JOIN Orders o 
INNER JOIN Order_items oi
ON oi.order_id = oi.item_id
ON oi.item_id = c.customer_id ;

-- This Command Create View Of The Table (TO Solve This I Ask Chatgpt TO Create This)
CREATE VIEW high_value_orders AS
SELECT o.order_id, c.name, o.total_amount
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
WHERE o.total_amount > 200;

SELECT * FROM high_value_orders;

CREATE INDEX name_index ON Customers(name);

SHOW INDEXES FROM Customers;

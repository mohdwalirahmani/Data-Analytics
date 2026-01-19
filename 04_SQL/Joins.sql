CREATE DATABASE Prime;
USE Prime;

-- Customer table
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
	CustomerName VARCHAR(50),
	Email VARCHAR(50)
);

INSERT INTO Customers (CustomerName, Email)
VALUES
('Ali', 'ali@gmail.com'),
('Sara', 'sara@gmail.com'),
('kk', 'kk@gmail.com'),
('Ayesha', 'ayesha@gmail.com'),
('Rahul', 'rahul@gmail.com'),
('Neha', 'neha@gmail.com');

SELECT * FROM Customers;

-- Orders table
CREATE TABLE Orders (
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
	OrderDate DATE,
	Amount DECIMAL(10,2),
	CustomerID INT,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderDate, Amount, CustomerID)
VALUES
('2025-01-10', 1200, 1),
('2025-01-12', 800, 2),
('2025-01-13', 1500, 1),
('2025-01-15', 600, 3),
('2025-01-22', 1100, 1),
('2025-01-25', 700, 2);

SELECT * FROM Orders;

-- Inner Join
SELECT c.CustomerID, o.OrderID, c.CustomerName
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Left Join
SELECT *
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Right Join
SELECT *
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Outer Join
SELECT *
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
UNION
SELECT *
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Cross Join
SELECT *
FROM Customers
CROSS JOIN Orders;
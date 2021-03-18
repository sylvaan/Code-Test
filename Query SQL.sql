CREATE DATABASE DepStore
USE DepStore

--Creating Tables
CREATE TABLE DepartmentStore (
	StoreID INT PRIMARY KEY,
	StoreName VARCHAR(255),
	StoreAddress VARCHAR(255),
	StorePhoneNum INT,
	StoreEmail VARCHAR(255)
);

CREATE TABLE Customer (
	CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR(255),
	CustomerGender VARCHAR(1),
	CustomerAddress VARCHAR(255),
	CustomerPhoneNum INT
);

CREATE TABLE Product (
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(255),
	ProductType VARCHAR(255),
	AvailableQty INT,
	ProductPrice INT,
	Discount INT
);

CREATE TABLE Transactions (
	TransactionID INT PRIMARY KEY,
	TransactionDate DATETIME,
	StoreID INT FOREIGN KEY REFERENCES DepartmentStore(StoreID),
	CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
	ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
	Quantity INT,
	Discount INT,
	TotalPrice INT
);

--Inserting into table (just for testing)
INSERT INTO DepartmentStore VALUES
('10001', 'AKEI Department Store', 'Virginia Avenue', '021991281', 'AKEIVirginia@akei.com');

INSERT INTO Customer VALUES
('20001', 'Jue Viole Grace', 'M', '35 Kevin Road', '029191829'),
('20002', 'Silvana', 'F', '23 Charleton Road', '029121412');

INSERT INTO Product VALUES
('30001', 'ASOS Laptop', 'Electronics', '45', '15000000', '25'),
('30002', 'Velvetine Helmet', 'Accessories', '21', '24000', '0');

INSERT INTO Transactions VALUES
('40001', '2021-12-11', '10001', '20001', '30001', '2', '25', '22500000'),
('40002', '2020-10-12', '10001', '20002', '30002', '20', '0', '48000');

SELECT * FROM DepartmentStore
SELECT * FROM Customer
SELECT * FROM Product
SELECT * FROM Transactions

--Queries
--2
SELECT
a.ProductID,
ProductName,
Sold = SUM(Quantity)
FROM
Product a 
JOIN Transactions b ON a.ProductID = b.ProductID
JOIN Customer c ON b.CustomerID = c.CustomerID
WHERE CustomerGender = 'F'
GROUP BY a.ProductID, ProductName

SELECT
a.ProductID,
ProductName,
Sold = SUM(Quantity)
FROM
Product a 
JOIN Transactions b ON a.ProductID = b.ProductID
JOIN Customer c ON b.CustomerID = c.CustomerID
WHERE CustomerGender = 'M'
GROUP BY a.ProductID, ProductName
-- it can be done only by changing the gender in WHERE, but just in case I will provide both queries
--3
SELECT TOP 1
a.CustomerID,
CustomerName,
MoneySpent = SUM(TotalPrice)
FROM
Customer a
JOIN Transactions b ON a.CustomerID = b.CustomerID
GROUP BY a.CustomerID, CustomerName

--4
SELECT
TransactionDate = DATEPART(HOUR, TransactionDate) / 2,
Transactions = COUNT(TransactionID)
FROM
Transactions
GROUP BY TransactionDate
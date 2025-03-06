/*
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Qty INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Production (
    ProductionID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    QtyProduced INT NOT NULL,
    ProductionDate DATE NOT NULL,
    Status VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

*/

-- Retrieve all Customers
SELECT * FROM Customers;

-- Retrieve all other tables
select * from OrderItems;
select * from Orders;
select * from Products;
select * from Production;


-- Retrieve all Orders with Customer Information
SELECT Orders.OrderID, Customers.Name, Orders.OrderDate, Orders.TotalAmount, Orders.Status 
FROM Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Retrieve all Order Items with Product Details
SELECT OrderItems.OrderItemID, Orders.OrderID, Products.Name, OrderItems.Qty 
FROM OrderItems 
JOIN Orders ON OrderItems.OrderID = Orders.OrderID 
JOIN Products ON OrderItems.ProductID = Products.ProductID;

-- Retrieve all Production Records with Product Details
SELECT Production.ProductionID, Products.Name, Production.QtyProduced, Production.ProductionDate, Production.Status 
FROM Production 
JOIN Products ON Production.ProductID = Products.ProductID;

-- Retrieve Total Sales Per Product
SELECT Products.Name, SUM(OrderItems.Qty) AS TotalSold 
FROM OrderItems 
JOIN Products ON OrderItems.ProductID = Products.ProductID 
GROUP BY Products.Name;

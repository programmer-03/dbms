-- Create the courier database if it doesn't exist
CREATE DATABASE courier;

-- Use the courier database
USE courier;

-- Create the Login table
CREATE TABLE IF NOT EXISTS Login (
    loginId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(20)
);

-- Insert 10 random values into the Login table
INSERT INTO Login (username, email, password, role) 
VALUES 
('Alice', 'alice@example.com', 'password1', 'user'),
('Bob', 'bob@example.com', 'password2', 'user'),
('Charlie', 'charlie@example.com', 'password3', 'user'),
('David', 'david@example.com', 'password4', 'user'),
('Emily', 'emily@example.com', 'password5', 'user'),
('Admin1', 'admin1@example.com', 'adminpass1', 'admin'),
('Admin2', 'admin2@example.com', 'adminpass2', 'admin'),
('Admin3', 'admin3@example.com', 'adminpass3', 'admin'),
('Admin4', 'admin4@example.com', 'adminpass4', 'admin'),
('Admin5', 'admin5@example.com', 'adminpass5', 'admin');

-- Create the Customer table
CREATE TABLE IF NOT EXISTS Customer (
    customerId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    addItem BOOLEAN,
    deleteItem BOOLEAN,
    address VARCHAR(255),
    mobileNo VARCHAR(15),
    status VARCHAR(20)
);

-- Insert 10 random values into the Customer table
INSERT INTO Customer (username, addItem, deleteItem, address, mobileNo, status) 
VALUES 
('John Doe', TRUE, TRUE, '123 Main St, City', '1234567890', 'active'),
('Jane Smith', TRUE, TRUE, '456 Elm St, Town', '9876543210', 'active'),
('Alice Johnson', TRUE, TRUE, '789 Oak St, Village', '1112223333', 'active'),
('Bob Williams', TRUE, TRUE, '246 Maple St, County', '4445556666', 'active'),
('Emily Brown', TRUE, TRUE, '135 Pine St, Borough', '7778889999', 'active'),
('David Lee', TRUE, TRUE, '579 Cedar St, Hamlet', '1010101010', 'active'),
('Emma Davis', TRUE, TRUE, '802 Walnut St, Township', '1212121212', 'active'),
('Michael Wilson', TRUE, TRUE, '643 Birch St, Municipality', '1313131313', 'active'),
('Olivia Taylor', TRUE, TRUE, '945 Spruce St, Parish', '1414141414', 'active'),
('William Anderson', TRUE, TRUE, '384 Ash St, Precinct', '1515151515', 'active');

-- Create the Admin table
CREATE TABLE IF NOT EXISTS Admin (
    adminId INT PRIMARY KEY AUTO_INCREMENT,
    customerId INT,
    deliveryPersonId INT,
    name VARCHAR(50),
    mobileNo VARCHAR(15),
    status VARCHAR(20),
    officeId INT,
    FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);

-- Insert 10 random values into the Admin table
INSERT INTO Admin (customerId, deliveryPersonId, name, mobileNo, status, officeId) 
VALUES 
(1, 1, 'Admin1', '1234567890', 'active', 1),
(2, 2, 'Admin2', '9876543210', 'active', 2),
(3, 3, 'Admin3', '1112223333', 'active', 3),
(4, 4, 'Admin4', '4445556666', 'active', 4),
(5, 5, 'Admin5', '7778889999', 'active', 5),
(6, 6, 'Admin6', '1010101010', 'active', 6),
(7, 7, 'Admin7', '1212121212', 'active', 7),
(8, 8, 'Admin8', '1313131313', 'active', 8),
(9, 9, 'Admin9', '1414141414', 'active', 9),
(10, 10, 'Admin10', '1515151515', 'active', 10);

-- Create the DeliveryPerson table
CREATE TABLE IF NOT EXISTS DeliveryPerson (
    deliveryPersonId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    itemId INT,
    shipmentId INT,
    sendersName VARCHAR(50),
    receiversAddress VARCHAR(255),
    itemDetails VARCHAR(255),
    billPayments DECIMAL(10, 2),
    FOREIGN KEY (itemId) REFERENCES Items(itemId),
    FOREIGN KEY (shipmentId) REFERENCES Shipment(shipmentId)
);

SHOW TABLES;

-- Insert 10 random values into the DeliveryPerson table
INSERT INTO DeliveryPerson (name, itemId, shipmentId, sendersName, receiversAddress, itemDetails, billPayments) 
VALUES 
('John', 1, 1, 'John Doe', '123 Main St, City', 'Small package', 50.00),
('Jane', 2, 2, 'Jane Smith', '456 Elm St, Town', 'Large package', 100.00),
('Alice', 3, 3, 'Alice Johnson', '789 Oak St, Village', 'Fragile item', 75.00),
('Bob', 4, 4, 'Bob Williams', '246 Maple St, County', 'Documents', 25.00),
('Emily', 5, 5, 'Emily Brown', '135 Pine St, Borough', 'Electronics', 150.00),
('David', 6, 6, 'David Lee', '579 Cedar St, Hamlet', 'Clothing', 50.00),
('Emma', 7, 7, 'Emma Davis', '802 Walnut St, Township', 'Books', 30.00),
('Michael', 8, 8, 'Michael Wilson', '643 Birch St, Municipality', 'Perishables', 80.00),
('Olivia', 9, 9, 'Olivia Taylor', '945 Spruce St, Parish', 'Furniture', 200.00),
('William', 10, 10, 'William Anderson', '384 Ash St, Precinct', 'Tools', 120.00);

-- Create the Items table
CREATE TABLE IF NOT EXISTS Items (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255),
    weight DECIMAL(10, 2),
    size VARCHAR(20),
    code VARCHAR(10)
);

-- Insert 10 random values into the Items table
INSERT INTO Items (description, weight, size, code) 
VALUES 
('Small Box', 1.5, 'Small', 'ABC123'),
('Large Box', 3.0, 'Large', 'DEF456'),
('Envelope', 0.2, 'Small', 'GHI789'),
('Electronics', 2.0, 'Medium', 'JKL012'),
('Documents', 0.1, 'Small', 'MNO345'),
('Clothing', 1.0, 'Medium', 'PQR678'),
('Books', 1.8, 'Large', 'STU901'),
('Perishables', 2.5, 'Medium', 'VWX234'),
('Furniture', 50.0, 'Large', 'YZA567'),
('Tools', 5.0, 'Large', 'BCD890');

-- Create the Shipment table
CREATE TABLE IF NOT EXISTS Shipment (
    shipmentId INT PRIMARY KEY AUTO_INCREMENT,
    itemId INT,
    status VARCHAR(20),
    shippingDate DATE,
    arrivalDate DATE,
    fromCity VARCHAR(50),
    toCity VARCHAR(50),
    weight DECIMAL(10, 2),
    FOREIGN KEY (itemId) REFERENCES Items(itemId)
);


-- Insert 10 random values into the Shipment table
INSERT INTO Shipment (itemId, status, shippingDate, arrivalDate, fromCity, toCity, weight) 
VALUES 
(1, 'In Transit', '2024-03-20', '2024-03-25', 'City A', 'City B', 2.0),
(2, 'Delivered', '2024-03-18', '2024-03-22', 'City C', 'City D', 5.0),
(3, 'In Transit', '2024-03-19', '2024-03-24', 'City E', 'City F', 1.5),
(4, 'Delivered', '2024-03-21', '2024-03-26', 'City G', 'City H', 3.0),
(5, 'In Transit', '2024-03-22', '2024-03-27', 'City I', 'City J', 4.0),
(6, 'Delivered', '2024-03-23', '2024-03-28', 'City K', 'City L', 2.5),
(7, 'In Transit', '2024-03-24', '2024-03-29', 'City M', 'City N', 1.8),
(8, 'Delivered', '2024-03-25', '2024-03-30', 'City O', 'City P', 1.0),
(9, 'In Transit', '2024-03-26', '2024-03-31', 'City Q', 'City R', 3.5),
(10, 'Delivered', '2024-03-27', '2024-04-01', 'City S', 'City T', 2.0);

-- Perform set operations, subqueries, and joins as per requirements

-- Example: Select all columns from the Login table
SELECT * FROM Login;

-- Example: Select all columns from the Customer table where status is 'active'
SELECT * FROM Customer WHERE status = 'active';


SELECT * FROM Customer c
INNER JOIN Admin a ON c.customerId = a.customerId;

SELECT *
FROM Customer c
LEFT JOIN Admin a ON c.customerId = a.customerId;

SELECT *
FROM Customer c
RIGHT JOIN Admin a ON c.customerId = a.customerId;

SELECT *
FROM Customer c
JOIN Admin a ON c.customerId = a.customerId;




-- Set Operations:

-- Union of usernames from Login and Customer tables
SELECT username FROM Login
UNION
SELECT username FROM Customer;

SELECT DISTINCT l.username
FROM Login l
INNER JOIN Customer c ON l.username = c.username;

-- Subquery in SELECT clause to get the count of active customers
SELECT 
    (SELECT COUNT(*) FROM Customer WHERE status = 'active') AS active_customers_count;


-- Subquery in WHERE clause to find customers who have placed orders
SELECT * FROM Customer 
WHERE customerId IN (SELECT DISTINCT customerId FROM Admin);


-- Subquery in FROM clause to find average bill payments per delivery person
SELECT deliveryPersonId, AVG(billPayments) AS avg_bill_payments
FROM (SELECT * FROM DeliveryPerson) AS dp
GROUP BY deliveryPersonId;


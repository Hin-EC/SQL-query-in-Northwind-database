-- select database to work on /not execute text/  

USE northwind; 

-- select all from customer table 
SELECT * FROM customers; 

-- select all from categories table and slect the categoryID = Null 
SELECT * FROM categories WHERE categoryID = Null; 

-- select CusomerName, City, Country and address from customer 

SELECT CustomerName, City, Country FROM customers; 

-- select ProductID and pordcutName from product 
SELECT ProductID, ProductName FROM products; 

-- select first name, last name and birth date from employee 
SELECT LastName, FirstName, BirthDate FROM employees; 

-- select customer name, customer address, city from customer 
SELECT CustomerName, Address, City FROM customers; 

/* SELECT DISTINCT to remove duplicated result */ 

SELECT DISTINCT Country FROM customers; 


-- use count function to count the result of distinct and non distinct 
SELECT COUNT(DISTINCT Country), COUNT(Country) FROM customers; 


-- select all custoemr from Mexico and customerID is 2 or 3 
SELECT * FROM customers WHERE Country = "Mexico" AND customerID IN (2,3); 

-- select all custoemr from Mexico and customerID is between 2 to 30
SELECT * FROM customers WHERE Country = "Mexico" AND customerID BETWEEN 2 AND 30; 

-- select all custoemr from Germany and from the city Berlin or Stuttgart
SELECT * FROM Customers WHERE Country='Germany' AND (City='Berlin' OR City='Stuttgart'); 


-- return number of Customers from USA. 
SELECT COUNT(Country) FROM customers WHERE Country = "USA"; 

-- numberic operator =, > 
SELECT * FROM Customers WHERE CustomerID = 1; 
SELECT * FROM Products WHERE Price > 100; 


-- result is from 1996-07 
SELECT * FROM Orders WHERE OrderDate > '1996-07-30';-- result is after 1996-07-30 

-- Write SQL query to return Customers with their customerid is equal to and greater than 15. 
SELECT * FROM Customers WHERE CustomerID >= 15; 

-- Write SQL query to return order details where order quantity is less than 3. 
SELECT * FROM Order_details WHERE Quantity < 3; 

-- Write SQL query to find details of employees who were born after 1960-01-01. order by asceding or descending
SELECT * FROM Employees WHERE BirthDate > '1960-01-01'; 
SELECT * FROM Employees WHERE BirthDate > '1960-01-01' ORDER BY BirthDate ASC; 
SELECT * FROM Employees WHERE BirthDate > '1960-01-01' ORDER BY BirthDate DESC; 

-- Write SQL query to find orders before 1996-08-27 or after 1997-02-21 
SELECT * FROM Orders WHERE OrderDate < "1996-08-27" OR OrderDate > "1997-02-21"; 

-- Write SQL query to return product names and order by Price. SELECT ProductName, price FROM products ORDER BY price; 
SELECT ProductName, price FROM products ORDER BY price ASC, ProductName DESC; 


-- Write an SQL query to get the top 10 products from the Products table with a Price greater than 20, limiting the result to 10 rows. 
SELECT * FROM Products WHERE Price > 20 ORDER BY Price DESC LIMIT 10; 

-- 2) Write an SQL query to find the first 3 customer in the Customers table who live in 'London'. 
SELECT * FROM Customers WHERE City = 'London' LIMIT 3; 

-- MAX() AND MIN() for select column 
SELECT MIN(Price) as 'the smallest price' FROM Products; 
SELECT MAX(Price) as 'the largest price' FROM Products; 

-- Write an SQL query to find the customer with the most recent OrderDate in the Orders table. 

SELECT MAX(OrderDate) FROM Orders; 
SELECT CustomerID FROM Orders WHERE OrderDate = (SELECT MAX(OrderDate) FROM Orders); 
SELECT * FROM Customers WHERE CustomerID = ( SELECT CustomerID FROM Orders WHERE OrderDate = ( SELECT MAX(OrderDate) FROM Orders ) ); 

-- Write an SQL query to find the product with the highest price from the Products table. 

SELECT MAX(Price) FROM Products; 
SELECT * FROM Products WHERE price = (SELECT MAX(Price) FROM Products); 

-- Write an SQL query to retrieve the product with the lowest Quantity in the OrderDetails table. 
 SELECT MIN(Quantity) FROM Order_details;  
 SELECT ProductID FROM Order_details WHERE Quantity = (SELECT MIN(Quantity) FROM Order_details); 
 SELECT * FROM Products 
 WHERE ProductID IN ( 
	SELECT ProductID FROM Order_details 
    WHERE Quantity = ( SELECT MIN(Quantity) FROM Order_details ) ); 

-- COUNT(), AVG(), SUM() for select column 

-- count the row of result 
SELECT COUNT(ProductID) FROM Products;

-- give the average of price and NULL is ignore 
SELECT AVG(Price) FROM Products; 

-- give teh sum of order quantity 
SELECT SUM(Quantity) FROM Order_details; 

-- Write an SQL query to find customers whose CustomerName does not start with 'a'. 
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'a%'; 

-- Write an SQL query to find all suppliers from countries that contain the substring 'land' 
-- (e.g., 'Finland', 'Poland') in the Country field. 
SELECT * FROM Suppliers WHERE Country LIKE '%land'; 

-- Write an SQL query to find all employees whose FirstName contains the letter 'n ' as the second character. 
SELECT * FROM Employees WHERE FirstName LIKE '_n%'; 

-- Write an SQL query to find all shippers whose ShipperName contains the word 'Express'. 
SELECT * FROM shippers WHERE ShipperName LIKE '%Express%';  

-- Write an SQL query to find all customers from either Berlin, 'Paris', or 'Madrid' in the Customers table. 
SELECT * FROM Customers WHERE City IN ('Berlin', 'Paris', 'Madrid'); 

-- Write an SQL query to find all orders that were shipped by ShipperID 1 or 3 from the Orders table. 
SELECT * FROM Orders WHERE ShipperID IN (1, 3); 

-- Write an SQL query to find all orders that were not shipped by ShipperID 1 or 3 from the Orders table. 
SELECT * FROM Orders WHERE ShipperID NOT IN (1, 3); 

-- /Write an SQL query to find all customers who have placed an order. Use a subquery on the Orders table to match the customers. (Use subquery)/ 

SELECT * FROM Customers 
WHERE CustomerID IN (SELECT CustomerID FROM Orders); 

-- Between condition 

SELECT * FROM Customers; SELECT * FROM Customers WHERE Country NOT BETWEEN 'Germany' AND 'UK'; 
SELECT * FROM Customers WHERE City Between 'LONDON' AND 'Sevilla' ORDER BY City; 
SELECT * FROM Customers WHERE City Between 'L%' AND 'S%' ORDER BY Country; 

-- Write a query to select all products with a unit price between 50 and 100. 
SELECT * FROM Products WHERE price BETWEEN 50 AND 100; 

-- Write a query to retrieve all orders placed between January 1, 1996, and December 31, 1996. 
SELECT * FROM Orders WHERE OrderDate; SELECT * FROM Orders WHERE OrderDate BETWEEN '01-01-1996' AND '31-12-1996'; -- not work 
SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-01-01' AND '1996-12-31'; -- work 
SELECT * FROM Orders WHERE OrderDate BETWEEN '1996/01/01' AND '1996/12/31'; -- work  

-- Write a query to retrieve order details where the quantity is between 5 and 15 
SELECT * FROM Order_details WHERE Quantity BETWEEN 5 AND 15; 

-- Alias 
SELECT CustomerID as ID, CustomerName as 'NAME' FROM Customers; 

-- 'name' is a reserved work 
SELECT CustomerID as ID, CustomerName as 'NAME' FROM Customers as c; 
SELECT CustomerName, CONCAT_WS(', ', Address, PostalCode, City, Country) AS Address FROM Customers; 

SELECT CustomerName, CONCAT( Address, PostalCode,', ', City,'- ', Country) AS Address FROM Customers; 

SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID; 

SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c CROSS JOIN Orders AS o; 

SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o; 


-- Retrieve only the "CustomerName" and "City" columns from the "Customers" table. 
SELECT CustomerName as 'Name', City FROM Customers; 
  

-- Write a query to list the employees who handled each order, along with the order date.   
SELECT LastName, FirstName, OrderDate  
FROM employees AS e 
INNER JOIN orders AS o ON e.EmployeeID = o.EmployeeID 
ORDER BY OrderDate; 

  

-- Write a query to find all orders shipped by a specific  shipper (e.g., ShipperName = 'Speedy Express').  

SELECT ShipperName, OrderID 
FROM shippers AS s 
INNER JOIN orders AS o ON s.ShipperID = o.ShipperID 
WHERE ShipperName = 'Speedy Express' 
ORDER BY OrderDate; 


-- Write a query to display all products  along with their category names.   
SELECT ProductName, CategoryName 
FROM products AS p 
INNER JOIN categories AS c ON c.CategoryID = p.CategoryID; 

  

-- Write a query to list all products and their quantities  for each order.  
SELECT OrderDetailID, ProductName, Quantity 
FROM products AS p 
INNER JOIN order_details AS o ON o.ProductID = p.ProductID; 

  

-- Write SQL query to list the number of customers in each country.   
SELECT country AS Country, COUNT(Country) AS 'Number of Customer' FROM customers  
GROUP BY country ORDER BY COUNT(Country) DESC; 

  

  

-- Write a query to list each product category and the total quantity of products sold in that category.   
SELECT * 
FROM products AS p 
INNER JOIN order_details AS o ON o.ProductID = p.ProductID 
INNER JOIN categories AS c ON c.CategoryID = p.CategoryID; 

  

SELECT c.CategoryName AS 'product category', SUM(Quantity) AS'total quantity' 
FROM products AS p 
INNER JOIN order_details AS o ON o.ProductID = p.ProductID 
INNER JOIN categories AS c ON c.CategoryID = p.CategoryID 
GROUP BY c.CategoryName; 

  

--  Write a query to list each employee and the number of orders they have handled.  
SELECT e.LastName, e.FirstName, COUNT(o.EmployeeID) AS 'Order Number' 
FROM orders AS o 
INNER jOIN employees AS e ON o.EmployeeID = e.EmployeeID 
GROUP BY o.EmployeeID; 


SELECT e.LastName, e.FirstName, COUNT(o.OrderID) AS 'Order Number' 
FROM orders AS o 
	INNER jOIN employees AS e ON o.EmployeeID = e.EmployeeID 
GROUP BY o.EmployeeID; 

--  Write a query to list each ShipperName and the number of orders
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders 
	JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID 
GROUP BY ShipperName; 

--  Write a query to list each ShipperName and the number of orders more than 70
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders 
	JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID 
GROUP BY ShipperName HAVING COUNT(Orders.OrderID) > 70; 

-- Write SQL query to find supplier of each product 
SELECT ProductName, SupplierName 
FROM products AS p 
	JOIN suppliers AS s ON p.SupplierID = s.SupplierID; 



-- Retrieve all products belonging to the meat/poultry category 

SELECT ProductName, CategoryName 
FROM products AS p 
	JOIN categories AS s ON p.CategoryID = s.CategoryID 
WHERE CategoryName = 'Meat/Poultry'; 

  

-- Retrieve the order ID, order date, customer name, and employee name for all orders. 

SELECT OrderID, OrderDate, CustomerName, CONCAT( e.LastName, ' ', e.FirstName) AS employeeName 
FROM orders AS o 
	JOIN customers AS c  
	ON o.CustomerID = c.CustomerID 
	JOIN employees AS e 
	ON o.EmployeeID = e.EmployeeID; 


-- Retrieve the product name, category name, and supplier name for all products. 

SELECT ProductName, CategoryName, SupplierName 
FROM products AS p 
	JOIN categories AS c  
	ON p.CategoryID = c.CategoryID 
	JOIN suppliers AS s  
	ON p.SupplierID = s.SupplierID; 

  

-- Create a report for all the orders of 1996 and their Customers. 

SELECT * 
FROM orders AS o 
	JOIN customers AS c  
	ON o.CustomerID = c.CustomerID 
WHERE OrderDate BETWEEN '1996-01-01' AND '1996-12-31' ; 

-- Retrieve all categories along with the number of products in each category. 

SELECT CategoryName, COUNT(ProductName) AS 'the number of products' 
FROM products AS p 
	JOIN categories AS c  
	ON p.CategoryID = c.CategoryID 
GROUP BY CategoryName; 

  

-- Retrieve all products with their prices and the quantity ordered for each product. 

SELECT OrderID, ProductName, Price, Quantity, (Price * Quantity) AS TotalPrice 
FROM products AS p 
	JOIN order_details AS o 
	ON o.ProductID = p. ProductID; 

 

 
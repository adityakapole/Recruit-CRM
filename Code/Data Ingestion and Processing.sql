CREATE DATABASE IF NOT EXISTS store;
USE store;
SELECT * FROM orders;
SELECT * FROM returns;
SELECT * FROM users;
ALTER TABLE orders
CHANGE COLUMN `Order ID` `Order_ID` VARCHAR(255);
ALTER TABLE orders
CHANGE COLUMN `Customer ID` `Order_ID` VARCHAR(255);
ALTER TABLE orders
CHANGE COLUMN `Customer Name` `Customer_Name` VARCHAR(255);
ALTER TABLE orders
CHANGE COLUMN `Product Category` `Product_Category` VARCHAR(255);
ALTER TABLE orders
CHANGE COLUMN `Product Name` `Product_Name` VARCHAR(255);
-- ALTER TABLE orders
-- CHANGE COLUMN `Order Name` `Order_Name` VARCHAR(255);
ALTER TABLE orders
CHANGE COLUMN `Quantity Ordered` `Quantity_Ordered` VARCHAR(255);
ALTER TABLE orders
CHANGE COLUMN `Unit Price` `Unit_Price` VARCHAR(255);
ALTER TABLE orders
CHANGE COLUMN `Order Date` `Order_Date` VARCHAR(255);
ALTER TABLE orders
CHANGE COLUMN `Quantity Ordered` `Quantity_Ordered` VARCHAR(255);

ALTER TABLE returns
CHANGE COLUMN `Order ID` `Order_ID` VARCHAR(255);

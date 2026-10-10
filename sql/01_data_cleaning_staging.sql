-- Creating a staging table so our orignal data stays untouched in case of any mistake we can recover it 

CREATE TABLE `sales2` (
  `Row ID` int DEFAULT NULL,
  `Order ID` text,
  `Order Date` DATE,
  `Ship Date` DATE,
  `Ship Mode` text,
  `Customer ID` text,
  `Customer Name` text,
  `Segment` text,
  `City` text,
  `State` text,
  `Country` text,
  `Postal Code` text,
  `Market` text,
  `Region` text,
  `Product ID` text,
  `Category` text,
  `Sub-Category` text,
  `Product Name` text,
  `Sales` double DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `Profit` double DEFAULT NULL,
  `Shipping Cost` double DEFAULT NULL,
  `Order Priority` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- inserting all the cleaned data in that stagging table
INSERT INTO sales2
SELECT TRIM(`Row ID`) AS `Row ID`
,TRIM(`Order ID`) AS `Order ID`
,STR_TO_DATE(`Order Date`,'%d-%m-%Y') AS `Order Date`
,STR_TO_DATE(`Ship Date`,'%d-%m-%Y') AS `Ship Date`
,TRIM(`Ship Mode`) AS `Ship Mode`
,TRIM(`Customer ID`) AS `Customer ID`
,TRIM(`Customer Name`) AS `Customer Name`
,TRIM(`Segment`) AS `Segment`
,TRIM(`City`) AS `City`
,TRIM(`State`) AS `State`
,TRIM(`Country`) AS `Country`
,TRIM(`Postal Code`) AS `Postal Code`
,TRIM(`Market`) AS `Market`
,TRIM(`Region`) AS `Region`
,TRIM(`Product ID`) AS `Product ID`
,TRIM(`Category`) AS `Category`
,TRIM(`Sub-Category`) AS `Sub-Category`
,TRIM(`Product Name`) AS `Product Name`
,TRIM(`Sales`) AS `Sales`
,TRIM(`Quantity`) AS `Quantity`
,TRIM(`Discount`) AS `Discount`
,TRIM(`Profit`) AS `Profit`
,TRIM(`Shipping Cost`) AS `Shipping Cost`
,TRIM(`Order Priority`) AS `Order Priority`
FROM sales;


UPDATE sales2
SET `Postal Code` = COALESCE(REPLACE(CAST(`Postal Code` AS CHAR), '.0', ''), 'N/A');

ALTER TABLE sales2 RENAME TO sales_cleaned;

-- We have to round sales also

UPDATE sales_cleaned
SET `Sales` = ROUND(`Sales`, 0);

SELECT *
FROM sales_cleaned;

-- NOW Data is cleaned :)
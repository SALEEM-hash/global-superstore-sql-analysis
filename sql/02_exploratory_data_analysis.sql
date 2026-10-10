--------------------------------------------------------------------------------
-- Project: Global Superstore 2 - Exploratory Data Analysis (EDA)
-- Author: Saleem
-- Database Engine: MySQL 8.0
-- Description: Translates core business questions into analytical SQL queries 
-- covering performance, customer behavior, and discount impact.
--------------------------------------------------------------------------------

SELECT *
FROM sales_cleaned;


-- Total Sales,Total Profit,Total Orders and Profit Margin Percentage

SELECT 
SUM(`Sales`) AS Total_Sales,
ROUND(SUM(`Profit`),2) AS Total_Profit,
COUNT(DISTINCT(`Order ID`)) AS Total_Orders,
ROUND((SUM(`Profit`)/SUM(`Sales`))*100,2) AS `Profit Margin Percentage`
FROM sales_cleaned;


-- Product category that are loosing us money 

SELECT category,ROUND(SUM(Profit),2) As Total_loss
FROM sales_cleaned
WHERE `Profit` < 0
GROUP BY `category`
ORDER BY `Total_loss`
;  


-- Product sub-category that are loosing us money 

SELECT `Sub-Category`,ROUND(SUM(Profit),2) As Total_loss
FROM sales_cleaned
WHERE `Profit` < 0
GROUP BY `Sub-Category`
ORDER BY `Total_loss`
;  
-- Top 10 Products by revenue

SELECT `Product Name`,ROUND(SUM(`Profit`),2) AS Total_Profit
FROM sales_cleaned
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Top 10 Products by Highest Sales

SELECT `Product Name`,ROUND(SUM(`Sales`),2) AS Total_Sales
FROM sales_cleaned
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;


-- Top 5 Countries with highest profit
SELECT `Country`,ROUND(SUM(`Profit`),2) AS Total_Profit
FROM sales_cleaned
GROUP BY `Country`
ORDER BY Total_Profit DESC
LIMIT 5; 

-- Top 5 Countries with Lowest profit
SELECT `Country`,ROUND(SUM(`Profit`),2) AS Total_Profit
FROM sales_cleaned
GROUP BY `Country`
ORDER BY Total_Profit ASC
LIMIT 5; 

-- Top 10 highest spending customers
SELECT `Customer Name`,Count(`Order ID`) AS Order_Placed
FROM sales_cleaned
GROUP BY `Customer Name`
ORDER BY Order_Placed DESC
LIMIT 10;

-- Wich Segment gives more revenue,Orders,Sales,Profit_Margin%

SELECT 
`Segment`,
ROUND(SUM(`Profit`),2) AS Total_Profit,
COUNT(`Order ID`) As Order_Placed,
ROUND(SUM(`Sales`),2) AS Total_Sales,
ROUND(((SUM(`Profit`)/SUM(`Sales`))*100),2) AS `Profit_Margin%`
FROM sales_cleaned
GROUP BY `Segment`
ORDER BY Total_Sales DESC;

-- Discount Impacts
SELECT `Discount`,
ROUND(SUM(`Sales`),2) AS Total_Sales,
ROUND(SUM(`Profit`),2) AS Total_Profit,
ROUND(((SUM(`Profit`)/SUM(`Sales`))*100),2) AS `Profit_Margin%`,
COUNT(DISTINCT(`Order ID`)) AS Total_Order
FROM sales_cleaned
GROUP BY `Discount`
ORDER BY `Discount`;


-- Avergae Shipping days of all Deleivery methods
SELECT 
    `Ship Mode`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(AVG(DATEDIFF(`Ship Date`, `Order Date`)), 1) AS Avg_Delivery_Days,
    ROUND(AVG(`Shipping Cost`), 2) AS Avg_Shipping_Cost
FROM sales_cleaned
GROUP BY `Ship Mode`
ORDER BY Avg_Delivery_Days ASC;

-- Time trends
SELECT 
YEAR(`Order Date`) AS `year`,
MONTH(`Order Date`) AS `month`,
ROUND(SUM(`Sales`),2) AS total_sales,
ROUND(SUM(`Profit`),2) AS total_profit,
COUNT(DISTINCT(`Order ID`)) AS total_orders
FROM sales_cleaned
GROUP BY YEAR(`Order Date`), MONTH(`Order Date`)
ORDER BY YEAR(`Order Date`) ASC, MONTH(`Order Date`) ASC;
 
 
 -- Busiest Months
 
SELECT 
MONTHNAME(`Order Date`) AS month_name,
MONTH(`Order Date`) AS month_num,
ROUND(SUM(`Sales`),2) AS total_sales,
ROUND(SUM(`Profit`),2) AS total_profit,
COUNT(DISTINCT(`Order ID`)) AS total_orders
FROM sales_cleaned
GROUP BY month_name,month_num
ORDER BY total_sales DESC;
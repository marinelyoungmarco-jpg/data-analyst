SELECT * FROM directory limit 

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'directory';

-- Number of Starbucks stores by country?
SELECT COUNTRY,
COUNT(*) AS Total_Stores
from directory
group by country
order by Total_stores DESC;

-- Top 10 countries with the most stores 

SELECT TOP 10 
Country,
count(*) AS Total_stores
from directory
group by Country
order by Total_stores DESC;

-- Number of stores by ownership type
SELECT
    [Ownership Type],
    COUNT(*) AS Total_Stores
FROM directory
GROUP BY [Ownership Type];

-- Countries with both Company-Owned and Licensed stores
SELECT Country,
      [Ownership Type],
       COUNT(*) AS Total
FROM directory
GROUP BY Country, [Ownership Type]
ORDER BY Country;

-- Number of stores per city
SELECT City,
       COUNT(*) AS Total_Stores
FROM directory
GROUP BY City
ORDER BY Total_Stores DESC;

-- Number of stores per state/province
SELECT [State/Province],
       COUNT(*) AS Total_Stores
FROM directory
GROUP BY [State/Province]
ORDER BY Total_Stores DESC;

--  List all stores in the Philippines
SELECT *
FROM directory
WHERE Country = 'PH'; 

-- List all stores in the korea
SELECT * 
FROM directory 
WHERE Country = 'JAPAN';

-- LIST all the stores in the usa
SELECT *
FROM directory
WHERE Country = 'china';

--  Find all licensed stores
SELECT *
FROM directory
WHERE [Ownership Type] = 'Licensed';

--  Find all company-owned stores
SELECT *
FROM directory
WHERE [Ownership Type] = 'Company Owned';

--  Count stores in each timezone
SELECT Timezone,
       COUNT(*) AS Total_Stores
FROM directory
GROUP BY Timezone
ORDER BY Total_Stores DESC; 

-- Search for stores in a specific city
SELECT *
FROM directory
WHERE City = 'Dubai';

SELECT *
FROM directory 
WHERE City = 'manila';

--  Countries with more than 100 stores
SELECT Country,
       COUNT(*) AS Total_Stores
FROM directory
GROUP BY Country
HAVING COUNT(*) > 100

--  Total number of Starbucks stores
SELECT COUNT(*) AS Total_Stores
FROM directory;

--  Unique countries
SELECT DISTINCT Country
FROM directory
ORDER BY Country;

-- Find duplicate store names
SELECT [Store Name],
       COUNT(*) AS Duplicate_Count
FROM directory
GROUP BY [Store Name]
HAVING COUNT(*) > 1;

-- Adding sales , revenue, profit in the database 
ALTER TABLE directory
ADD Sales DECIMAL(10,2),
    Revenue DECIMAL(10,2),
    Profit DECIMAL(10,2);

-- UPDATE 
UPDATE directory
SET
    Sales = FLOOR(RAND(CHECKSUM(NEWID())) * 901) + 100,

    Revenue = ROUND(
        (FLOOR(RAND(CHECKSUM(NEWID())) * 901) + 100) *
        (RAND(CHECKSUM(NEWID())) * 8 + 4),
        2
    ),

    Profit = ROUND(
        (
            (FLOOR(RAND(CHECKSUM(NEWID())) * 901) + 100) *
            (RAND(CHECKSUM(NEWID())) * 8 + 4)
        ) *
        (RAND(CHECKSUM(NEWID())) * 0.20 + 0.20),
        2
    );

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'directory';

UPDATE directory
SET
    Sales = FLOOR(RAND(CHECKSUM(NEWID())) * 900) + 100,
    Revenue = FLOOR(RAND(CHECKSUM(NEWID())) * 50000) + 5000,
    Profit = FLOOR(RAND(CHECKSUM(NEWID())) * 15000) + 1000;

    SELECT TOP 10
    Brand,
    [Store Name],
    Country,
    Sales,
    Revenue,
    Profit
FROM directory;

--  Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM directory

-- Total Revenue
SELECT SUM(Revenue) AS Total_Revenue
FROM directory;

-- total profit
SELECT SUM(Profit)  AS Total_Profit
FROM directory;

-- revenue by country
SELECT 
Country,
sum(revenue) as total_revenue
from directory
group by country
order by total_revenue DESC;

-- profit by country
SELECT
Country,
sum(profit) as total_profit
from directory
group by country
order by total_profit DESC;

-- sales by country
SELECT 
Country,
sum(sales) as total_sales
from directory
group by country 
order by total_sales DESC;

-- Profit by Ownership Type
SELECT
    [Ownership Type],
    SUM(Profit) AS Total_Profit
FROM directory
GROUP BY [Ownership Type]
ORDER BY Total_Profit DESC;
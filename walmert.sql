----------------------------------------------
--🕒 TIME OF DAY CATEGORIZATION
----------------------------------------------

ALTER TABLE sales ADD time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = CASE
    WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'morning'
    WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'afternoon'
    ELSE 'evening'
END;

SELECT Time,
       CASE
           WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'morning'
           WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'afternoon'
           ELSE 'evening'
       END AS time_of_day
FROM sales;

----------------------------------------------
--📅 DAY NAME
----------------------------------------------

ALTER TABLE sales ADD DayName VARCHAR(10);

UPDATE sales
SET DayName = DATENAME(WEEKDAY, Date);

SELECT Date,
       DATENAME(WEEKDAY, Date) AS DayName
FROM sales;

----------------------------------------------
--🗓️ MONTH NAME
----------------------------------------------

ALTER TABLE sales ADD MonthName VARCHAR(20);

UPDATE sales
SET MonthName = DATENAME(MONTH, Date);

SELECT Date,
       DATENAME(MONTH, Date) AS MonthName
FROM sales;

----------------------------------------------
--🏙️ GENERIC INSIGHTS
----------------------------------------------

-- Unique cities
SELECT DISTINCT City FROM sales;

-- City with branch
SELECT DISTINCT City, Branch FROM sales;

----------------------------------------------
--📦 PRODUCT ANALYSIS
----------------------------------------------

-- Distinct product lines
SELECT COUNT(DISTINCT [Product line]) FROM sales;

-- Most common payment method
SELECT Payment,
       COUNT(Payment) AS most_used
FROM sales
GROUP BY Payment
ORDER BY most_used DESC;

-- Most selling product line
SELECT [Product line],
       COUNT([Product line]) AS most_used
FROM sales
GROUP BY [Product line]
ORDER BY most_used DESC;

-- Total revenue by month
SELECT MonthName,
       SUM(Total) AS total_revenue
FROM sales
GROUP BY MonthName
ORDER BY total_revenue DESC;

-- Month with highest COGS
SELECT MonthName,
       SUM(COGS) AS cogs
FROM sales
GROUP BY MonthName
ORDER BY cogs DESC;

-- Product line with highest revenue
SELECT [Product line],
       SUM(Total) AS total_revenue
FROM sales
GROUP BY [Product line]
ORDER BY total_revenue DESC;

-- City with highest revenue
SELECT City,
       SUM(Total) AS total_revenue
FROM sales
GROUP BY City
ORDER BY total_revenue DESC;

-- Product line with highest VAT
SELECT [Product line],
       AVG([Tax 5%]) AS avg_tax
FROM sales
GROUP BY [Product line]
ORDER BY avg_tax DESC;

-- Branches that sold more than average quantity
SELECT Branch,
       SUM(Quantity) AS qty
FROM sales
GROUP BY Branch
HAVING SUM(Quantity) > (SELECT AVG(Quantity) FROM sales);

-- Most common product line by gender
SELECT Gender,
       [Product line],
       COUNT([Product line]) AS total
FROM sales
GROUP BY Gender, [Product line]
ORDER BY total DESC;

-- Average rating per product line
SELECT [Product line],
       AVG(Rating) AS avg_rating
FROM sales
GROUP BY [Product line]
ORDER BY avg_rating DESC;

----------------------------------------------
--💰 SALES ANALYSIS
----------------------------------------------

-- Sales by time of day on Sunday
SELECT time_of_day,
       SUM(Total) AS total
FROM sales
WHERE DayName = 'Sunday'
GROUP BY time_of_day
ORDER BY total DESC;

-- Customer type with highest revenue
SELECT [Customer type],
       SUM(Total) AS total
FROM sales
GROUP BY [Customer type]
ORDER BY total DESC;

-- City with highest VAT
SELECT City,
       AVG([Tax 5%]) AS vat
FROM sales
GROUP BY City
ORDER BY vat DESC;

-- Customer type with highest VAT
SELECT [Customer type],
       AVG([Tax 5%]) AS vat
FROM sales
GROUP BY [Customer type]
ORDER BY vat DESC;

----------------------------------------------
--🙋 CUSTOMER ANALYSIS
----------------------------------------------

-- Unique customer types
SELECT DISTINCT [Customer type] FROM sales;

-- Unique payment methods
SELECT DISTINCT Payment FROM sales;

-- Most common customer type
SELECT [Customer type],
       COUNT(*) AS common_customer
FROM sales
GROUP BY [Customer type]
ORDER BY common_customer DESC;

-- Most common gender
SELECT Gender,
       COUNT(*) AS most
FROM sales
GROUP BY Gender
ORDER BY most DESC;

-- Gender distribution per branch
SELECT Branch, Gender, COUNT(*) AS total
FROM sales
GROUP BY Branch, Gender
ORDER BY Branch, total DESC;

----------------------------------------------
--⭐ RATING ANALYSIS
----------------------------------------------

-- Time of day with highest ratings
SELECT time_of_day,
       AVG(Rating) AS rate
FROM sales
GROUP BY time_of_day
ORDER BY rate DESC;

-- Ratings per branch by time of day
SELECT Branch, time_of_day,
       AVG(Rating) AS rate
FROM sales
GROUP BY Branch, time_of_day
ORDER BY Branch, rate DESC;

-- Best average rating day
SELECT DayName,
       AVG(Rating) AS rate
FROM sales
GROUP BY DayName
ORDER BY rate DESC;

-- Best average rating per branch
SELECT Branch, DayName,
       AVG(Rating) AS rate
FROM sales
GROUP BY Branch, DayName
ORDER BY Branch, rate DESC;




-- Financial Sales & Profit Analysis
-- Dataset: Microsoft Financial Sample
-- Author: Rizky Budi Tyaswarman

-- Query 1: Total Sales and Profit by Country
SELECT 
    Country,
    ROUND(SUM(CAST(REPLACE(REPLACE(Sales, '$', ''), ',', '') AS REAL)), 2) AS Total_Sales,
    ROUND(SUM(CAST(REPLACE(REPLACE(Profit, '$', ''), ',', '') AS REAL)), 2) AS Total_Profit,
    ROUND((SUM(CAST(REPLACE(REPLACE(Profit, '$', ''), ',', '') AS REAL)) / 
           SUM(CAST(REPLACE(REPLACE(Sales, '$', ''), ',', '') AS REAL))) * 100, 2) AS Profit_Margin_Pct
FROM financial_data
GROUP BY Country
ORDER BY Total_Sales DESC;

-- Query 2: Sales Performance by Product
SELECT 
    Product,
    ROUND(SUM(CAST(REPLACE(REPLACE(Sales, '$', ''), ',', '') AS REAL)), 2) AS Total_Sales,
    ROUND(SUM(CAST(REPLACE(REPLACE(Profit, '$', ''), ',', '') AS REAL)), 2) AS Total_Profit,
    SUM(CAST(REPLACE([Units Sold], ',', '') AS INTEGER)) AS Total_Units_Sold,
    ROUND((SUM(CAST(REPLACE(REPLACE(Profit, '$', ''), ',', '') AS REAL)) / 
           SUM(CAST(REPLACE(REPLACE(Sales, '$', ''), ',', '') AS REAL))) * 100, 2) AS Profit_Margin_Pct
FROM financial_data
GROUP BY Product
ORDER BY Total_Profit DESC;

-- Query 3: Monthly Profit Trend Analysis
SELECT 
    Date,
    ROUND(SUM(CAST(REPLACE(REPLACE(Sales, '$', ''), ',', '') AS REAL)), 2) AS Monthly_Sales,
    ROUND(SUM(CAST(REPLACE(REPLACE(Profit, '$', ''), ',', '') AS REAL)), 2) AS Monthly_Profit,
    SUM(CAST(REPLACE([Units Sold], ',', '') AS INTEGER)) AS Monthly_Units_Sold,
    ROUND((SUM(CAST(REPLACE(REPLACE(Profit, '$', ''), ',', '') AS REAL)) / 
           SUM(CAST(REPLACE(REPLACE(Sales, '$', ''), ',', '') AS REAL))) * 100, 2) AS Profit_Margin_Pct
FROM financial_data
GROUP BY Date
ORDER BY Date ASC;
-- Task 4
SELECT 
    -- Extract the month from the cleaned and formatted Order_Date column
    MONTH(STR_TO_DATE(TRIM(Order_Date), '%m/%d/%Y')) AS Order_Month,
    
    -- Sum of all products sold in each month
    SUM(Quantity_Ordered) AS Total_Products_Sold,
    
    -- Sum of all sales generated in each month
    SUM(Sales) AS Total_Sales_Generated
FROM orders
    -- Group the data by the month (calculated from Order_Date)
GROUP BY Order_Month
    -- Sort the results by month in ascending order
ORDER BY Order_Month;

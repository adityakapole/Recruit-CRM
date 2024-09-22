CREATE DATABASE IF NOT EXISTS crm;
select * from crm.users;


-- TASK 1
-- Step 1: Join the Orders and Users tables on Region
SELECT 
    U.Manager,                       -- Select the manager responsible for the region
    SUM(O.Sales) AS Total_Sales      -- Sum the total sales for each manager
FROM 
    Orders O
JOIN 
    Users U ON O.Region = U.Region   -- Join Orders with Users on the Region column
-- Step 2: Group by manager to calculate total sales per manager
GROUP BY 
    U.Manager
-- Step 3: Order by total sales in descending order to get the highest sales first
ORDER BY 
    Total_Sales DESC
-- Step 4: Limit the result to one row to get the manager with the highest sales
LIMIT 1;





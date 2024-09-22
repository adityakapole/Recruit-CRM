




-- TASK 2
-- Step 1: Group by Product Name and Calculate Total Quantity and Revenue
SELECT 
    O.Product_Name,                -- Select the product name
    SUM(O.Quantity_Ordered) AS Total_Quantity, -- Sum of the quantity ordered
    SUM(O.Sales) AS Total_Revenue  -- Sum of the total sales to calculate revenue
FROM 
    Orders O
-- Step 2: Group by product to get total quantity sold per product
GROUP BY 
    O.Product_Name
-- Step 3: Order by total quantity sold in descending order to find the most sold product
ORDER BY 
    Total_Quantity DESC
-- Step 4: Offset the most sold product and get the second most sold product
LIMIT 1 OFFSET 1;

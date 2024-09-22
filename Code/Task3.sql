ALTER TABLE returns
CHANGE COLUMN `Order ID` `Order_ID` VARCHAR(255);



-- TASK 3
-- Step 1: Join the Orders and Returns tables on Order_ID
SELECT 
    O.Customer_Name,                    -- Select the customer name
    SUM(O.Quantity_Ordered) AS Total_Returned_Products  -- Sum of returned products
FROM 
    Orders O
JOIN 
    Returns R ON O.Order_ID = R.Order_ID  -- Join Orders with Returns on Order_ID
-- Step 2: Filter only the returned orders
WHERE 
    R.Status = 'Returned'                -- Only consider orders with 'Returned' status
-- Step 3: Group by customer name to get the total quantity of products returned per customer
GROUP BY 
    O.Customer_Name
-- Step 4: Order by total quantity returned in descending order to find the top customers
ORDER BY 
    Total_Returned_Products DESC
-- Step 5: Limit the result to the top 3 customers who return the most products
LIMIT 3;

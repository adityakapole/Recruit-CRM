-- Get the top 5 product categories by total sales
SELECT 
    O.Product_Category,                -- Select the product category
    SUM(O.Sales) AS Total_Revenue       -- Sum of total sales for each product category
FROM 
    Orders O
GROUP BY 
    O.Product_Category                 -- Group by product category
ORDER BY 
    Total_Revenue DESC                 -- Order by revenue in descending order
LIMIT 5;                               -- Limit the result to top 5 categories



-- Segment customers based on the number of orders they placed
SELECT 
    O.Customer_Name,                  -- Select customer name
    COUNT(O.Order_ID) AS Order_Count  -- Count the number of orders placed by each customer
FROM 
    Orders O
GROUP BY 
    O.Customer_Name                   -- Group by customer to get their order count
ORDER BY 
    Order_Count DESC;                 -- Order by order count in descending order



-- Calculate the return rate by product category
SELECT 
    O.Product_Category,                -- Select the product category
    COUNT(R.Order_ID) AS Returned_Orders, -- Count of returned orders
    COUNT(O.Order_ID) AS Total_Orders,    -- Count of total orders in that category
    (COUNT(R.Order_ID) * 100.0 / COUNT(O.Order_ID)) AS Return_Rate -- Calculate return rate as a percentage
FROM 
    Orders O
LEFT JOIN 
    Returns R ON O.Order_ID = R.Order_ID  -- Join Orders with Returns on Order_ID
GROUP BY 
    O.Product_Category                  -- Group by product category
HAVING 
    COUNT(O.Order_ID) > 0               -- Ensure that categories with at least one order are considered
ORDER BY 
    Return_Rate DESC;                   -- Order by return rate in descending order



-- Sales performance by region and manager
SELECT 
    U.Region,                         -- Select the region
    U.Manager,                        -- Select the manager
    SUM(O.Sales) AS Total_Sales       -- Sum of total sales for each region and manager
FROM 
    Orders O
JOIN 
    Users U ON O.Region = U.Region    -- Join Orders with Users on Region
GROUP BY 
    U.Region, U.Manager               -- Group by both region and manager
ORDER BY 
    Total_Sales DESC;                 -- Order by total sales in descending order




-- Peak sales day of the week and time of day
SELECT 
    EXTRACT(DOW FROM O.Order_Date) AS Day_of_Week,  -- Extract day of week (0 = Sunday, 6 = Saturday)
    EXTRACT(HOUR FROM O.Order_Date) AS Hour_of_Day, -- Extract hour of the day
    SUM(O.Sales) AS Total_Sales                    -- Sum of total sales for each day and time
FROM 
    Orders O
GROUP BY 
    EXTRACT(DOW FROM O.Order_Date), 
    EXTRACT(HOUR FROM O.Order_Date)               -- Group by both day of week and hour of day
ORDER BY 
    Total_Sales DESC;                             -- Order by total sales in descending order




-- Top 3 customers by total revenue
SELECT 
    O.Customer_Name,                -- Select the customer name
    SUM(O.Sales) AS Total_Revenue    -- Sum of total sales per customer
FROM 
    Orders O
GROUP BY 
    O.Customer_Name                 -- Group by customer
ORDER BY 
    Total_Revenue DESC              -- Order by total revenue in descending order
LIMIT 3;                            -- Limit the result to the top 3 customers

select * from supply_chain_inv limit 10;

-- Check for NULL values in the dataset
SELECT COUNT(*) AS total_rows,
SUM(CASE WHEN Store_ID IS NULL THEN 1 ELSE 0 END) AS null_store_id,
SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS null_product_id,
SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS null_date,
SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category,
SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS null_region,
SUM(CASE WHEN Inventory_Level IS NULL THEN 1 ELSE 0 END) AS null_inventory_level,
SUM(CASE WHEN Units_Sold IS NULL THEN 1 ELSE 0 END) AS null_units_sold,
SUM(CASE WHEN Units_Ordered IS NULL THEN 1 ELSE 0 END) AS null_units_ordered,
SUM(CASE WHEN Demand_Forecast IS NULL THEN 1 ELSE 0 END) AS null_demand_forecast,
SUM(CASE WHEN Price IS NULL THEN 1 ELSE 0 END) AS null_price,
SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS null_discount,
SUM(CASE WHEN Weather_Condition IS NULL THEN 1 ELSE 0 END) AS null_weather_condition,
SUM(CASE WHEN Holiday_Promotion IS NULL THEN 1 ELSE 0 END) AS null_holiday_promotion,
SUM(CASE WHEN Competitor_Pricing IS NULL THEN 1 ELSE 0 END) AS null_competitor_pricing,
SUM(CASE WHEN Seasonality IS NULL THEN 1 ELSE 0 END) AS null_seasonality
FROM supply_chain_inv;
-- No Null Values

-- Descriptive statistics for numerical columns
SELECT AVG(Inventory_Level) AS avg_inventory,
AVG(Units_Sold) AS avg_units_sold,
AVG(Units_Ordered) AS avg_units_ordered,
AVG(Demand_Forecast) AS avg_demand_forecast,
AVG(Price) AS avg_price,
AVG(Discount) AS avg_discount
FROM supply_chain_inv;
-- average inventory = 274.4699
-- average units sold = 136.4649
-- average units ordered = 110.0045
-- average price = 55.135
-- average discount = 10

-- Count of products by category
SELECT Category, 
COUNT(*) AS product_count
FROM supply_chain_inv
GROUP BY Category;
-- groceries = 14611
-- toys = 14643
-- electronics = 14521
-- furniture 14699
-- clothing = 14626

-- Count of sales by region
SELECT Region, 
SUM(Units_Sold) AS total_units_sold
FROM supply_chain_inv
GROUP BY Region;
-- north = 2484966
-- south = 2507799
-- west = 2471552
-- east = 2511265

-- Production volumes and stock levels
SELECT Product_ID, 
SUM(Units_Sold) AS total_units_sold, 
SUM(Inventory_Level) AS total_inventory
FROM supply_chain_inv
GROUP BY Product_ID;

-- Revenue distribution by region
SELECT Region, 
SUM(Units_Sold * Price) AS total_revenue
FROM supply_chain_inv
GROUP BY Region;
-- 	North = 137255267.34999922
-- 	South = 138483566.83999994
-- 	West = 135777996.38999987
-- 	East = 138712054.3300002

-- Comparison of price by product type
SELECT Category, 
AVG(Price) AS avg_price
FROM supply_chain_inv
GROUP BY Category;
-- Groceries	55.27122168229417
-- Toys	        55.03241002526797
-- Electronics	55.31076303284889
-- Furniture	55.17586094292146
-- Clothing	    54.88660194174727

-- Relationship between production volume, stock levels, and order quantities
SELECT Product_ID, 
SUM(Units_Sold) AS total_units_sold, 
SUM(Inventory_Level) AS total_inventory, 
SUM(Units_Ordered) AS total_units_ordered
FROM supply_chain_inv
GROUP BY Product_ID;









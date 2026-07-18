CREATE DATABASE RetailDW;
GO

USE RetailDW;
GO

/*
SELECT *
FROM Dimproducts

SELECT *
FROM DimRegion

SELECT *
FROM DimCustomers

SELECT *
FROM DimCalendar

SELECT *
FROM Factsales

EXEC sp_rename 'DimCalendar.column1', 'Month', 'COLUMN';

EXEC sp_rename 'DimCalendar.column2', 'Day', 'COLUMN';

EXEC sp_rename 'DimCalendar.column3', 'Year', 'COLUMN';

SELECT TOP 5 *
FROM FactSales;

UPDATE DimCalendar
SET date = CONCAT_WS('-', year, month, day);


*/


 --- Top 10 Products
SELECT TOP 10
    product_name,
    SUM(quantity) AS TotalSold
FROM FactSales fs
JOIN DimProducts dp
    ON fs.product_id = dp.product_id
GROUP BY product_name
ORDER BY TotalSold DESC;

--- Revenue by store

SELECT
    store_name,

    ROUND(SUM(quantity * product_retail_price),2)
    AS Revenue

FROM FactSales fs

JOIN DimProducts dp
    ON fs.product_id = dp.product_id

JOIN DimStores ds
    ON fs.store_id = ds.store_id

GROUP BY store_name

ORDER BY Revenue DESC;


---Monthly Sales Trend

SELECT
    date

   SUM(quantity * product_retail_price)
    AS Revenue

FROM FactSales fs

JOIN DimProducts dp
    ON fs.product_id = dp.product_id

JOIN DimCalendar dc
    ON fs.transaction_date = dc.date

GROUP BY
    date

ORDER BY
    date


--- sales by gender
SELECT
    gender,

   Round(SUM(quantity * product_retail_price),2)
    AS Revenue

FROM FactSales fs

JOIN DimCustomers dc
    ON fs.customer_id = dc.customer_id

JOIN DimProducts dp
    ON fs.product_id = dp.product_id

GROUP BY gender;

--- most returned products

SELECT
    product_name,

    COUNT(*) AS ReturnCount

FROM FactReturns fr

JOIN DimProducts dp
    ON fr.product_id = dp.product_id

GROUP BY product_name

ORDER BY ReturnCount DESC;

--- main analysis veiw 

CREATE VIEW vw_SalesAnalysis AS

SELECT
    fs.transaction_date,

    dp.product_name,
    dp.product_retail_price,
    dp.product_cost,

    dc.first_name,
    dc.last_name,
    dc.gender,
    dc.occupation,

    ds.store_name,
    ds.store_type,
    customer_city,
    customer_country,

    dr.sales_region,

    fs.quantity,

    fs.quantity * dp.product_retail_price
    AS Revenue,

    fs.quantity *
    (dp.product_retail_price - dp.product_cost)
    AS Profit

FROM FactSales fs

JOIN DimProducts dp
    ON fs.product_id = dp.product_id

JOIN DimCustomers dc
    ON fs.customer_id = dc.customer_id

JOIN DimStores ds
    ON fs.store_id = ds.store_id

JOIN DimRegion dr
    ON ds.region_id = dr.region_id;


 --- Retruns view 


 CREATE VIEW vw_ReturnsAnalysis AS

SELECT
    fr.return_date,

    dp.product_name,
    dp.product_brand,

    ds.store_name,

    dr.sales_region,

    fr.quantity

FROM FactReturns fr

JOIN DimProducts dp
    ON fr.product_id = dp.product_id

JOIN DimStores ds
    ON fr.store_id = ds.store_id

JOIN DimRegion dr
    ON ds.region_id = dr.region_id;

 

    ALTER VIEW vw_SalesAnalysis AS
SELECT
    fs.transaction_date,
    dp.product_name,
    dp.product_brand,
    dp.product_sku,
    dp.product_retail_price,
    dp.product_cost,
    dp.product_weight,
    dp.recyclable,
    dp.low_fat,
    dc.first_name,
    dc.last_name,
    dc.gender,
    dc.marital_status,
    dc.occupation,
    dc.yearly_income,
    dc.member_card,
    dc.customer_city,
    dc.customer_country,
    ds.store_name,
    ds.store_type,
    dr.sales_region,
    fs.quantity,
    fs.quantity * dp.product_retail_price
        AS Revenue,
    fs.quantity * (dp.product_retail_price - dp.product_cost)
        AS Profit
FROM FactSales fs
JOIN DimProducts dp
    ON fs.product_id = dp.product_id
JOIN DimCustomers dc
    ON fs.customer_id = dc.customer_id
JOIN DimStores ds
    ON fs.store_id = ds.store_id
JOIN DimRegion dr
    ON ds.region_id = dr.region_id;
    --- end

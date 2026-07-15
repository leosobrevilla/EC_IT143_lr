/*****************************************************************************************************************
NAME:    My Script Name
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/15/2026   DRODRIGUEZ   Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1 Business User question—Marginal complexity by Gabriel Ayeh:
--What are the ten most expensive products based on their list price?
SELECT TOP 10 ProductID,
			 Name,
			 ProductNumber,
			 ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- Q2 Business User question—Marginal complexity by Anthony Agyen:
--Which five countries generated the highest total sales tax amounts for our business?
SELECT TOP (5) ST.TerritoryID,
	   ST.Name,
	   SUM(TaxAmt) as TaxAmt
FROM Sales.SalesTerritory ST
LEFT JOIN Sales.SalesOrderHeader SOH ON ST.TerritoryID=SOH.TerritoryID
GROUP BY ST.TerritoryID,
		 ST.Name
ORDER BY TaxAmt DESC;

-- Q3 Business User question-Moderate Complexity by Yemiode Iwara:
--Which top 3 products sells most in the salesOrderDetail table? And let the product name show in the outcome.
SELECT TOP (3) 
	   PP.ProductID,
	   PP.Name,
	   SUM(SOD.OrderQty) as TotalUnitsSold
FROM Production.Product PP
INNER JOIN Sales.SalesOrderDetail SOD
	   ON PP.ProductID=SOD.ProductID
GROUP BY PP.ProductID,
		 PP.Name
ORDER BY TotalUnitsSold DESC;

--Q4 Business User question—Moderate complexity by Domkat Stephen Bess:
--We are reviewing discount usage. Which products receive the highest total discount amounts? 
--Combine SalesOrderDetail and Product, then rank products by total discount applied.
SELECT PP.ProductID,
	   PP.Name,
	   SUM(SOD.UnitPrice*SOD.OrderQty*SOD.UnitPriceDiscount) as TotalDiscount
FROM Production.Product PP
INNER JOIN Sales.SalesOrderDetail SOD
	   ON PP.ProductID=SOD.ProductID
GROUP BY PP.ProductID,
		 PP.Name
ORDER BY TotalDiscount DESC;

--Q5 Business User question - Increased complexity by James Mba Ikechukwu Onwuka:
--The executive team wants to evaluate bicycle sales during the second quarter of 2013. Please create a report 
--showing each bicycle category, the number of units sold, total sales amount, average selling price, 
--and estimated profit (List Price minus Standard Cost), grouped by month and sorted chronologically.
SELECT
    PC.Name AS Category,
    YEAR(SOH.OrderDate) AS SalesYear,
    MONTH(SOH.OrderDate) AS SalesMonth,
    SUM(SOD.OrderQty) AS UnitsSold,
    SUM(SOD.LineTotal) AS TotalSalesAmount,
    AVG(SOD.UnitPrice) AS AverageSellingPrice,
    SUM((PP.ListPrice - PP.StandardCost) * SOD.OrderQty) AS EstimatedProfit
FROM Sales.SalesOrderDetail SOD
INNER JOIN Sales.SalesOrderHeader SOH
    ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Production.Product PP
    ON SOD.ProductID = PP.ProductID
INNER JOIN Production.ProductSubcategory PSC
    ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID
INNER JOIN Production.ProductCategory PC
    ON PSC.ProductCategoryID = PC.ProductCategoryID
WHERE PC.Name = 'Bikes'
AND SOH.OrderDate >= '2013-04-01'
AND SOH.OrderDate < '2013-07-01'
GROUP BY
    PC.Name,
    YEAR(SOH.OrderDate),
    MONTH(SOH.OrderDate)
ORDER BY
    SalesYear,
    SalesMonth;

--Q6 Business User question - Increased complexity by Wagner Ever Montiel Sanchez:
--The operations department is concerned that shipping delays may be affecting customer satisfaction. 
--Analyze orders placed during 2012 by sales territory and month, showing the average number of days between 
--the order date and ship date, total orders processed, total sales amount, and the percentage of orders 
--shipped more than three days after purchase.
SELECT
    ST.Name AS SalesTerritory,
    YEAR(SOH.OrderDate) AS SalesYear,
    MONTH(SOH.OrderDate) AS SalesMonth,
    AVG(DATEDIFF(day, SOH.OrderDate, SOH.ShipDate)) AS AvgShippingDays,
    COUNT(SOH.SalesOrderID) AS TotalOrders,
    SUM(SOH.TotalDue) AS TotalSalesAmount,
    SUM(CASE 
            WHEN DATEDIFF(day, SOH.OrderDate, SOH.ShipDate) > 3 
            THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(SOH.SalesOrderID) AS LateShipmentPercentage
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesTerritory ST
    ON SOH.TerritoryID = ST.TerritoryID
WHERE SOH.OrderDate >= '2012-01-01'
AND SOH.OrderDate < '2013-01-01'
GROUP BY
    ST.Name,
    YEAR(SOH.OrderDate),
    MONTH(SOH.OrderDate)
ORDER BY
    SalesYear,
    SalesMonth,
    SalesTerritory;


--Q7 Metadata question by Leonardo Daniel Rodriguez:
--Which tables have Foreign Keys?
SELECT DISTINCT
    TABLE_NAME 'Table'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
ORDER BY TABLE_NAME;


--Q8 Metadata question by Leonardo Daniel Rodriguez:
--Which schema contains the highest number of base tables, and which contains the lowest?
SELECT 
    TABLE_SCHEMA,
    COUNT(*) AS TableCount
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
GROUP BY TABLE_SCHEMA
ORDER BY TableCount DESC;

 


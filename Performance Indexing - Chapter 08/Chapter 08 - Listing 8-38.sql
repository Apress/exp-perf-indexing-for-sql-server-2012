--Listing 8-38.  Included Columns Pattern
USE AdventureWorks2012
GO
IF OBJECT_ID('dbo.ProductSubcategorySummary') IS NOT NULL
    DROP VIEW dbo.ProductSubcategorySummary
SET STATISTICS IO ON
SELECT psc.Name
    ,SUM(sod.LineTotal) AS SumLineTotal
    ,SUM(sod.OrderQty) AS SumOrderQty
    ,AVG(sod.UnitPrice) AS AvgUnitPrice
FROM dbo.SalesOrderDetail sod
    INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
    INNER JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.
ProductSubcategoryID
GROUP BY psc.Name
ORDER BY psc.Name;
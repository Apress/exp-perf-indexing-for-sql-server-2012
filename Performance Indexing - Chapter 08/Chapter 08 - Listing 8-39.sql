--Listing 8-39.  Indexed View
USE AdventureWorks2012
GO
CREATE VIEW dbo.ProductSubcategorySummary
WITH SCHEMABINDING
AS
SELECT psc.NAME
  ,SUM(sod.LineTotal) AS SumLineTotal
  ,SUM(sod.OrderQty) AS SumOrderQty
  ,SUM(sod.UnitPrice) AS TotalUnitPrice
  ,COUNT_BIG(*) AS Occurances
FROM dbo.SalesOrderDetail sod
  INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
  INNER JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.
ProductSubcategoryID
GROUP BY psc.Name;
GO
CREATE UNIQUE CLUSTERED INDEX CLIX_ProductSubcategorySummary
   ON dbo.ProductSubcategorySummary(Name)
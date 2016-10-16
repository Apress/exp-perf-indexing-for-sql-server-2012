--Listing 8-40.  Indexed View
USE AdventureWorks2012
GO
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
SELECT Name
  ,SumLineTotal
  ,SumOrderQty
  ,TotalUnitPrice / Occurances AS AvgUnitPrice
FROM dbo.ProductSubcategorySummary
ORDER BY Name;
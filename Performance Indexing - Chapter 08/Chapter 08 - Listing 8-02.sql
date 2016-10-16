--Listing 8-2.  Temporary Object with Clustered Index
USE AdventureWorks2012
GO
CREATE TABLE #TempWithClusteredIX
  (
  SalesOrderID INT PRIMARY KEY CLUSTERED
  )
INSERT INTO #TempWithClusteredIX
SELECT SalesOrderID
FROM Sales.SalesOrderHeader
WHERE SalesPersonID = 283
SELECT sod.* FROM Sales.SalesOrderDetail sod
INNER JOIN #TempWithClusteredIX t ON t.SalesOrderID = sod.SalesOrderID
GO
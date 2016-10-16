--Listing 8-1.  Temporary Object with Heap
USE AdventureWorks2012
GO
CREATE TABLE #TempWithHeap
  (
  SalesOrderID INT
  );
INSERT INTO #TempWithHeap
SELECT SalesOrderID
FROM Sales.SalesOrderHeader
WHERE SalesPersonID = 283;
SELECT sod.* FROM Sales.SalesOrderDetail sod
  INNER JOIN #TempWithHeap t ON t.SalesOrderID = sod.SalesOrderID;
GO
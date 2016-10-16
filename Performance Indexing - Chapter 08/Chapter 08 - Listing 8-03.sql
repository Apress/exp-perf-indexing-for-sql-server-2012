--Listing 8-3.  EXISTS Example
SELECT sod.* FROM Sales.SalesOrderDetail sod
WHERE EXISTS (SELECT * FROM #TempWithHeap t WHERE t.SalesOrderID = sod.SalesOrderID);
GO
SELECT sod.* FROM Sales.SalesOrderDetail sod
WHERE EXISTS (SELECT * FROM #TempWithClusteredIX t WHERE t.SalesOrderID = sod.SalesOrderID);
--Listing 3-27.  T-SQL Script to Generate Page I/O Latch
USE AdventureWorks2012
GO
DBCC DROPCLEANBUFFERS
GO
SELECT *
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
GO
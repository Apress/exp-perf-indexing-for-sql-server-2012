--Listing 3-6.  Index Seek Queries
USE AdventureWorks2012
GO
SELECT * FROM Sales.SalesOrderDetail
WHERE SalesOrderID = 43659
GO
SELECT * FROM Sales.SalesOrderDetail
WHERE SalesOrderID BETWEEN 43659 AND 44659
GO
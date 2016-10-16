--Listing 3-10.  Index Lookup Query
USE AdventureWorks2012
GO
SELECT ProductID, CarrierTrackingNumber
FROM Sales.SalesOrderDetail
WHERE ProductID = 778
GO
--Listing 3-8.  Index Scan Queries
USE AdventureWorks2012
GO
SELECT * FROM Sales.SalesOrderDetail
GO
SELECT * FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '4911-403C-98'
GO
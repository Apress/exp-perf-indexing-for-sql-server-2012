--Listing 3-22.  T-SQL Script to Generate Row Locks
USE AdventureWorks2012
GO
SELECT SalesOrderID
  ,SalesOrderDetailID
  ,CarrierTrackingNumber
  ,OrderQty
FROM Sales.SalesOrderDetail
WHERE ProductID = 710
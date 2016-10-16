--Listing 8-37.  Row Compression Query
USE AdventureWorks2012
GO
SET STATISTICS IO ON
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber
FROM dbo.PageCompression
WHERE SalesOrderID BETWEEN 51500 AND 52000
--Listing 3-12.  Index Lookup Query
USE AdventureWorks2012
GO
INSERT INTO Sales.SalesOrderDetail
(SalesOrderID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, 
UnitPriceDiscount, Modi?edDate)
SELECT SalesOrderID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, 
UnitPriceDiscount, GETDATE() AS Modi?edDate
FROM Sales.SalesOrderDetail
WHERE SalesOrderDetailID = 1;
GO
UPDATE Sales.SalesOrderDetail
SET CarrierTrackingNumber = '999-99-9999'
WHERE Modi?edDate > DATEADD(d, -1, GETDATE());
GO
DELETE FROM Sales.SalesOrderDetail
WHERE Modi?edDate > DATEADD(d, -1, GETDATE());
GO
--Listing 5-1.  Table with No Index
SELECT * INTO MythOne
FROM Sales.SalesOrderDetail
GO
SET STATISTICS IO ON
SET NOCOUNT ON
GO
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, 
SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal
FROM MythOne
WHERE CarrierTrackingNumber = '4911-403C-98'
GO
SET STATISTICS IO OFF
GO
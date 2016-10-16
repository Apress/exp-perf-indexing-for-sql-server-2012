--Listing 5-3.  Adding an Index to MythOne
CREATE INDEX IX_CarrierTrackingNumber ON MythOne (CarrierTrackingNumber)
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
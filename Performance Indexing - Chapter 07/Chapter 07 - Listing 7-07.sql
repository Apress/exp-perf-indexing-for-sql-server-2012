--Listing 7-7.  Scenario Setup
USE AdventureWorks2012
GO
IF OBJECT_ID('dbo.SalesOrderDetail') IS NOT NULL
    DROP TABLE dbo.SalesOrderDetail;
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, 
SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, Modi?edDate
INTO dbo.SalesOrderDetail
FROM Sales.SalesOrderDetail;
CREATE CLUSTERED INDEX CL_SalesOrderDetail ON dbo.SalesOrderDetail(SalesOrderDetailID);
CREATE NONCLUSTERED INDEX IX_SalesOrderDetail ON dbo.SalesOrderDetail(SalesOrderID);
GO
SELECT SalesOrderID, CarrierTrackingNumber
INTO #temp
FROM dbo.SalesOrderDetail
WHERE SalesOrderID = 43660;
DROP TABLE #temp;
GO 1000
SELECT SalesOrderID, OrderQty
INTO #temp
FROM dbo.SalesOrderDetail
WHERE SalesOrderID = 43661;
DROP TABLE #temp;
GO 1000
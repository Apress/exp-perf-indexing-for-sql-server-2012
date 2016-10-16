--Listing 8-32.  Setup for Row Compression 
USE AdventureWorks2012
GO
IF OBJECT_ID('dbo.NoCompression') IS NOT NULL
  DROP TABLE dbo.NoCompression
IF OBJECT_ID('dbo.RowCompression') IS NOT NULL
  DROP TABLE dbo.RowCompression
SELECT SalesOrderID
    ,SalesOrderDetailID
    ,CarrierTrackingNumber
    ,OrderQty
    ,ProductID
    ,SpecialOfferID
    ,UnitPrice
    ,UnitPriceDiscount
    ,LineTotal
    ,rowguid
    ,Modi?edDate
INTO dbo.NoCompression
FROM Sales.SalesOrderDetail
SELECT SalesOrderID
    ,SalesOrderDetailID
    ,CarrierTrackingNumber
    ,OrderQty
    ,ProductID
    ,SpecialOfferID
    ,UnitPrice
    ,UnitPriceDiscount
    ,LineTotal
    ,rowguid
    ,Modi?edDate
INTO dbo.RowCompression
FROM Sales.SalesOrderDetail
--Listing 8-35.  Setup for Page Compression 
USE AdventureWorks2012
GO
IF OBJECT_ID('dbo.PageCompression') IS NOT NULL
    DROP TABLE dbo.PageCompression
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
INTO dbo.PageCompression
FROM Sales.SalesOrderDetail
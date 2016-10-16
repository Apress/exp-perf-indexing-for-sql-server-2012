--Listing 3-14.  Update for Sales.SalesOrderDetail
USE AdventureWorks2012
GO
UPDATE Sales.SalesOrderDetail
SET UnitPriceDiscount = 0.01
WHERE UnitPriceDiscount = 0.00
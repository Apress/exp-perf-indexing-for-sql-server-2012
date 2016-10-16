--Listing 3-25.  T-SQL Script to Generate Lock Promotion
USE AdventureWorks2012
GO
UPDATE Sales.SalesOrderDetail
SET ProductID = ProductID
WHERE ProductID <= 712
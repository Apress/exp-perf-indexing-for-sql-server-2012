--Listing 9-11.  Queries on FirstName Gustavo
USE AdventureWorks2012
GO
CREATE INDEX IX_SalesSalesOrderHeader_OrderDate ON Sales.SalesOrderHeader(OrderDate);
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE MONTH(OrderDate) = 12
AND YEAR(OrderDate) = 2006;
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '20061201' AND '20061231';
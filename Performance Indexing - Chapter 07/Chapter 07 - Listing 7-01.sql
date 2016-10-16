--Listing 7-1.  SQL Statements to Generate Missing Index Suggestions
SELECT DueDate FROM Sales.SalesOrderHeader
WHERE DueDate = '2001-07-13 00:00:00.000'
AND OrderDate = '2001-07-13 00:00:00.000'
GO
SELECT DueDate FROM Sales.SalesOrderHeader
WHERE OrderDate Between '20010701' AND '20010731'
AND DueDate Between '20010701' AND '20010731'
GO
SELECT DueDate, OrderDate FROM Sales.SalesOrderHeader
WHERE DueDate Between '20010701' AND '20010731'
GO
SELECT CustomerID, OrderDate FROM Sales.SalesOrderHeader
WHERE DueDate Between '20010701' AND '20010731'
AND OrderDate Between '20010701' AND '20010731'
GO
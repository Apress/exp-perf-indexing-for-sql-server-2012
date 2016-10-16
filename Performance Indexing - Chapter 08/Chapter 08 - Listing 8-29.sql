--Listing 8-29.  Foreign Key Pattern
CREATE INDEX IS_SalesOrderHeader_CustomerID ON dbo.SalesOrderHeader(CustomerID)
GO
SELECT MAX(c.CustomerID)
      FROM dbo.Customer c
      LEFT OUTER JOIN dbo.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
      WHERE soh.CustomerID IS NULL;
SET STATISTICS IO ON
DELETE FROM dbo.Customer
WHERE CustomerID = 700
SET STATISTICS IO OFF
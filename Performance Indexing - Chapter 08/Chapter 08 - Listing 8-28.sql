--Listing 8-28.  Foreign Key Pattern
SELECT MAX(c.CustomerID)
      FROM dbo.Customer c
      LEFT OUTER JOIN dbo.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
      WHERE soh.CustomerID IS NULL;
SET STATISTICS IO ON
DELETE FROM dbo.Customer
WHERE CustomerID = 701
SET STATISTICS IO OFF
--Listing 9-3.  Query for Addresses Using CONTAINS
USE AdventureWorks2012
GO
SET STATISTICS IO ON;
CREATE FULLTEXT CATALOG ftQueryStrategies AS DEFAULT;
CREATE FULLTEXT INDEX ON Person.Address(AddressLine1)
KEY INDEX PK_Address_AddressID;
GO
SELECT AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Person.Address
WHERE CONTAINS (AddressLine1,'Cynthia');
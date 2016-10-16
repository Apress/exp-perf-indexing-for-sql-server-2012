--Listing 9-1.  Query for Addresses Beginning with 710
USE AdventureWorks2012
GO
SET STATISTICS IO ON;
SELECT AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Person.Address
WHERE AddressLine1 LIKE '710%';
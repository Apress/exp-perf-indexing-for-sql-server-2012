--Listing 9-2.  Query for Addresses Containing “Cynthia”
USE AdventureWorks2012
GO
SET STATISTICS IO ON;
SELECT AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Person.Address
WHERE AddressLine1 LIKE '%Cynthia%';
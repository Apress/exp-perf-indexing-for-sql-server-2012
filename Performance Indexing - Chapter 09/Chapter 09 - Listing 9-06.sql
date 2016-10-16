--Listing 9-6.  Query with Concatenation Removed
USE AdventureWorks2012
GO
SET STATISTICS IO ON;
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE FirstName = 'Gustavo'
AND LastName = 'Achong';
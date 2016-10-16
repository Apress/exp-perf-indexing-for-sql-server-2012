--Listing 9-5.  Concatenation Without Spaces
USE AdventureWorks2012
GO
SET STATISTICS IO ON;
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE FirstName + LastName = 'GustavoAchong';
--Listing 9-4.  Query with Concatenation
USE AdventureWorks2012
GO
SET STATISTICS IO ON;
CREATE INDEX IX_PersonContact_FirstNameLastName ON Person.Person (FirstName, LastName)
GO
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE FirstName + ' ' + LastName = 'Gustavo Achong'
--Listing 9-8.  Computed Column Queries
USE AdventureWorks2012
GO
SELECT BusinessEntityID, FirstName, LastName, FirstLaseName
FROM Person.Person
WHERE FirstLaseName = 'Gustavo Achong';
SELECT BusinessEntityID, CalculateValue
FROM Person.Person
WHERE CalculateValue = 198;
--Listing 9-7.  Add Computed Columns to Person.Person
USE AdventureWorks2012
GO
ALTER TABLE Person.Person
ADD FirstLaseName AS (FirstName + ' ' + LastName)
,CalculateValue AS (BusinessEntityID * EmailPromotion);
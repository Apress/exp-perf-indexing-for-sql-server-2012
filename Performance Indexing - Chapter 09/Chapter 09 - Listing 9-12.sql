--Listing 9-12.  Data Conversion Setup
USE AdventureWorks2012
GO
SELECT BusinessEntityID
  ,CAST(FirstName as varchar(50)) as FirstName
  ,CAST(MiddleName as varchar(50)) as MiddleName
  ,CAST(LastName as varchar(50)) as LastName
INTO PersonPerson
FROM Person.Person;
CREATE CLUSTERED INDEX IX_PersonPerson_ContactID ON PersonPerson (BusinessEntityID);
CREATE INDEX IX_PersonContact_FirstName ON PersonPerson(FirstName);
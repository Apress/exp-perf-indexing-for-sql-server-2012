--Listing 9-9.  Computed Column Indexes
USE AdventureWorks2012
GO
CREATE INDEX IX_PersonPerson_FirstLaseName ON Person.Person(FirstLaseName);
CREATE INDEX IX_PersonPerson_CalculateValue ON Person.Person(CalculateValue);
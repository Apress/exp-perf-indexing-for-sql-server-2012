--Listing 9-13.  Implicit Conversion Queries
USE AdventureWorks2012
GO
SET STATISTICS IO ON
DECLARE @FirstName nvarchar(100)
SET @FirstName = 'Katherine';
SELECT * FROM PersonPerson
WHERE FirstName = @FirstName
OPTION (RECOMPILE);
GO
DECLARE @FirstName varchar(100)
SET @FirstName = 'Katherine';
SELECT * FROM PersonPerson
WHERE FirstName = @FirstName
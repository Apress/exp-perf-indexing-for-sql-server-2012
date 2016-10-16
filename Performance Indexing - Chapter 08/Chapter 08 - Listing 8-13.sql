--Listing 8-13.  Setup for Search Column Pattern
USE AdventureWorks2012
GO
CREATE TABLE dbo.Contacts (
ContactID int IDENTITY(1,1)
,FirstName nvarchar(50)
,LastName nvarchar(50)
,IsActive bit
,EmailAddress nvarchar(50)
,Certi?cationDate datetime
,FillerData char(1000)
,CONSTRAINT PK_Contacts PRIMARY KEY CLUSTERED (ContactID));
INSERT INTO dbo.Contacts (FirstName, LastName, IsActive, EmailAddress, Certi?cationDate)
SELECT pp.FirstName, pp.LastName, IIF(pp.BusinessEntityID/10=1,1,0), pea.EmailAddress,IIF(pp.BusinessEntityID/10=1,pp.Modi?edDate,NULL)
FROM Person.Person pp
INNER JOIN Person.EmailAddress pea ON pp.BusinessEntityID = pea.BusinessEntityID;
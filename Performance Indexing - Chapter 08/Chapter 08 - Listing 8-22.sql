--Listing 8-22.  Included Columns Pattern
CREATE INDEX IX_Contacts_FirstNameINC ON dbo.Contacts(FirstName)
       INCLUDE (LastName, IsActive, EmailAddress);
GO
SET STATISTICS IO ON;
SELECT ContactID, FirstName, LastName, EmailAddress FROM dbo.Contacts
WHERE FirstName = 'Catherine';
SET STATISTICS IO OFF;
GO
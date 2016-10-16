--Listing 8-18.  Multiple Column Pattern
CREATE INDEX IX_Contacts_FirstNameLastName ON dbo.Contacts(FirstName, LastName);
SET STATISTICS IO ON
SELECT ContactID, FirstName, LastName FROM dbo.Contacts
WHERE FirstName = 'Catherine'
AND LastName = 'Cox'
SET STATISTICS IO OFF
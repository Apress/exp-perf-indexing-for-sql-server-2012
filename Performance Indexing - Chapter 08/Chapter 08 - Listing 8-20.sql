--Listing 8-20.  Covering Index Pattern
CREATE INDEX IX_Contacts_FirstNameLastNameIsActive ON dbo.Contacts(FirstName, LastName, 
IsActive)
SET STATISTICS IO ON
SELECT ContactID, FirstName, LastName, IsActive FROM dbo.Contacts
WHERE FirstName = 'Catherine'
AND LastName = 'Cox'
SET STATISTICS IO OFF
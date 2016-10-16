--Listing 8-21.  Included Columns Pattern
SET STATISTICS IO ON
SELECT ContactID, FirstName, LastName, EmailAddress FROM dbo.Contacts
WHERE FirstName = 'Catherine'
SET STATISTICS IO OFF
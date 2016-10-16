--Listing 8-19.  Covering Index Pattern
SET STATISTICS IO ON
SELECT ContactID, FirstName, LastName, IsActive
FROM dbo.Contacts
WHERE FirstName = 'Catherine'
AND LastName = 'Cox'
SET STATISTICS IO OFF
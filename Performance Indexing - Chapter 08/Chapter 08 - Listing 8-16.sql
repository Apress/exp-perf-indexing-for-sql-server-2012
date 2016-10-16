--Listing 8-16.  Index Intersection Pattern
SET STATISTICS IO ON
SELECT ContactID, FirstName, LastName FROM dbo.Contacts
WHERE FirstName = 'Catherine'
AND LastName = 'Cox'
SET STATISTICS IO OFF
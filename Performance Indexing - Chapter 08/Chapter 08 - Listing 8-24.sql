--Listing 8-24.  Other Queries Against Included Columns Pattern
SET STATISTICS IO ON
SELECT ContactID, FirstName FROM dbo.Contacts
WHERE FirstName = 'Catherine';
SELECT ContactID, FirstName, LastName FROM dbo.Contacts
WHERE FirstName = 'Catherine'
AND LastName = 'Cox'
SELECT ContactID, FirstName, LastName, IsActive FROM dbo.Contacts
WHERE FirstName = 'Catherine'
AND LastName = 'Cox'
SET STATISTICS IO OFF
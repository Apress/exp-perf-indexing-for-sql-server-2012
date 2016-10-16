--Listing 8-17.  Index Intersection Pattern
CREATE INDEX IX_Contacts_LastName ON dbo.Contacts(LastName);
SET STATISTICS IO ON
SELECT ContactID, FirstName, LastName FROM dbo.Contacts
WHERE FirstName = 'Catherine'
AND LastName = 'Cox'
SET STATISTICS IO OFF
--Listing 8-15.  Search Column Pattern
CREATE INDEX IX_Contacts_FirstName ON dbo.Contacts(FirstName);
SET STATISTICS IO ON
SELECT ContactID, FirstName FROM dbo.Contacts
WHERE FirstName = 'Catherine';
SET STATISTICS IO OFF;
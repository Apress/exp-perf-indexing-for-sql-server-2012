--Listing 8-14.  Search Column Pattern
SET STATISTICS IO ON ;
SELECT ContactID, FirstName FROM dbo.Contacts
WHERE FirstName = 'Catherine';
SET STATISTICS IO OFF
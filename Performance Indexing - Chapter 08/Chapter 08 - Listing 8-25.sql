--Listing 8-25.  Filtered Index Pattern
SET STATISTICS IO ON
SELECT ContactID, FirstName, LastName, Certi?cationDate
FROM dbo.Contacts
WHERE Certi?cationDate IS NOT NULL
ORDER BY Certi?cationDate
SELECT ContactID, FirstName, LastName, Certi?cationDate
FROM dbo.Contacts
WHERE Certi?cationDate BETWEEN '20050101' AND '20050201'
ORDER BY Certi?cationDate
SET STATISTICS IO OFF

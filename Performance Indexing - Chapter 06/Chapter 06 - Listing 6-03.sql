--Listing 6-3.  INSERT into Uniqueidenti?er Table
INSERT INTO dbo.UsingUniqueidenti?er (Name, JunkValue)
SELECT name, REPLICATE('X', 2000)
FROM sys.objects
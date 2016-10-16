--Listing 2-3.  DBCC EXTENTINFO Example Two
INSERT INTO dbo.IndexInternalsOne
VALUES ('Demo'),('Demo');
GO
INSERT INTO dbo.IndexInternalsOne DEFAULT VALUES
GO 4
DBCC EXTENTINFO(0, IndexInternalsOne, -1)GOO
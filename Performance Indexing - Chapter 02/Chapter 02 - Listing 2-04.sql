--Listing 2-4.  DBCC EXTENTINFO Example Three
ALTER TABLE dbo.IndexInternalsOne REBUILD
GO
DBCC EXTENTINFO(0, IndexInternalsOne, -1)
GOO
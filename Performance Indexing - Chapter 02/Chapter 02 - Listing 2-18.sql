--Listing 2-18.  Script to Cause Page Splits
USE AdventureWorks2012
GO
UPDATE dbo.ClusteredPageSplits
SET FillerData = REPLICATE('X',2500)
WHERE RowId % 2 = 0;
DECLARE @ObjectID INT = OBJECT_ID('dbo.ClusteredPageSplits');
SELECT object_id, index_type_desc, index_level, page_count, record_count
FROM sys.dm_db_index_physical_stats (DB_ID(), @ObjectID, NULL, NULL, 'DETAILED');

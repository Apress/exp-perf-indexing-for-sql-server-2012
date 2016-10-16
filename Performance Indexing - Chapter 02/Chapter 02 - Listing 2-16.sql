--Listing 2-16.  Script to Cause Forwarded Records
USE AdventureWorks2012
GO
UPDATE dbo.HeapForwardedRecords
SET FillerData = REPLICATE('X',2500)
WHERE RowId % 2 = 0;
DECLARE @ObjectID INT = OBJECT_ID('dbo.HeapForwardedRecords');
SELECT object_id, index_type_desc, page_count, record_count, forwarded_record_count
FROM sys.dm_db_index_physical_stats (DB_ID(), @ObjectID, NULL, NULL, 'DETAILED');
GO
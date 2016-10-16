--Listing 2-15.  Forwarded Record Scenario
USE AdventureWorks2012
GO
CREATE TABLE dbo.HeapForwardedRecords
(
  RowId INT IDENTITY(1,1)
  ,FillerData VARCHAR(2500)
);
INSERT INTO dbo.HeapForwardedRecords (FillerData)
SELECT TOP 24 REPLICATE('X',2000)
FROM sys.objects;
DECLARE @ObjectID INT = OBJECT_ID('dbo.HeapForwardedRecords');
SELECT object_id, index_type_desc, page_count, record_count, forwarded_record_count
FROM sys.dm_db_index_physical_stats (DB_ID(), @ObjectID, NULL, NULL, 'DETAILED');
GOO
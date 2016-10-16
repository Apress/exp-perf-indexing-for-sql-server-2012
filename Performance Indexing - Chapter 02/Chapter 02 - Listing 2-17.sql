--Listing 2-17.  Page Split Scenario
USE AdventureWorks2012
GO
CREATE TABLE dbo.ClusteredPageSplits
(
  RowId INT IDENTITY(1,1)
  ,FillerData VARCHAR(2500)
  ,CONSTRAINT PK_ClusteredPageSplits PRIMARY KEY CLUSTERED (RowId)
);
INSERT INTO dbo.ClusteredPageSplits (FillerData)
SELECT TOP 24 REPLICATE('X',2000)
FROM sys.objects;
DECLARE @ObjectID INT = OBJECT_ID('dbo.ClusteredPageSplits');
SELECT object_id, index_type_desc, index_level, page_count, record_count
FROM sys.dm_db_index_physical_stats (DB_ID(), @ObjectID, NULL, NULL, 'DETAILED');
GO
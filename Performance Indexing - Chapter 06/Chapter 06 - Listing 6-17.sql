--Listing 6-17.  Script to Build Index I/O Example
IF OBJECT_ID('dbo.IndexIO') IS NOT NULL
    DROP TABLE dbo.IndexIO;
CREATE TABLE dbo.IndexIO
(
RowID int IDENTITY(1,1)
,Name sysname
,JunkValue varchar(2000)
);
INSERT INTO dbo.IndexIO (Name, JunkValue)
SELECT name, REPLICATE('X', 1000)
FROM sys.columns
CREATE CLUSTERED INDEX CLUS_IndexIO ON dbo.IndexIO(RowID);
UPDATE dbo.IndexIO
SET JunkValue = REPLICATE('X', 2000)
WHERE RowID % 5 = 1
SELECT i.name, ps.in_row_reserved_page_count
FROM sys.indexes i
INNER JOIN sys.dm_db_partition_stats ps ON i.object_id = ps.object_id AND i.index_id = ps.index_id
WHERE i.name = 'CLUS_IndexIO'
ALTER INDEX CLUS_IndexIO ON dbo.IndexIO REBUILD
SELECT i.name, ps.in_row_reserved_page_count
FROM sys.indexes i
INNER JOIN sys.dm_db_partition_stats ps ON i.object_id = ps.object_id AND i.index_id = ps.index_id
WHERE i.name = 'CLUS_IndexIO'
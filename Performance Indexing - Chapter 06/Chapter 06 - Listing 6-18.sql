--Listing 6-18.  Script to Rebuild Index to Remove Fragmentation
ALTER INDEX CLUS_IndexIO ON dbo.IndexIO REBUILD

SELECT i.name, ps.in_row_reserved_page_count
FROM sys.indexes i
INNER JOIN sys.dm_db_partition_stats ps ON i.object_id = ps.object_id AND i.index_id = ps.index_id
WHERE i.name = 'CLUS_IndexIO'
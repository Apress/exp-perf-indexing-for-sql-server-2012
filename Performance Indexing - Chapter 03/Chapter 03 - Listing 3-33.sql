--Listing 3-33.  Query for Page Latch Statistics in sys.dm_db_index_operational_stats
SELECT OBJECT_SCHEMA_NAME(ios.object_id) + '.' + OBJECT_NAME(ios.object_id) as table_name
  ,i.name as index_name
  ,ios.leaf_allocation_count
  ,ios.nonleaf_allocation_count
  ,ios.leaf_page_merge_count
  ,ios.nonleaf_page_merge_count
FROM sys.dm_db_index_operational_stats(DB_ID(), OBJECT_ID('dbo.AllocationCycle'), NULL,NULL) ios
  INNER JOIN sys.indexes i ON i.object_id = ios.object_id AND i.index_id = ios.index_id
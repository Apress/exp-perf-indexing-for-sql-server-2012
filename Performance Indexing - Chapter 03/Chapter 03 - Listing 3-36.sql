--Listing 3-36.  Query for Page Compression in sys.dm_db_index_operational_stats
SELECT OBJECT_SCHEMA_NAME(ios.object_id) + '.' + OBJECT_NAME(ios.object_id) as table_name
,i.name as index_name
,page_compression_attempt_count
,page_compression_success_count
FROM sys.dm_db_index_operational_stats (DB_ID(), OBJECT_ID('dbo.PageCompression'), NULL, NULL) ios
  INNER JOIN sys.indexes i ON i.object_id = ios.object_id AND i.index_id = ios.index_id
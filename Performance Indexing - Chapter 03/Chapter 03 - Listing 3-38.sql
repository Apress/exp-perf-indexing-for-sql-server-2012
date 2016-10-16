--Listing 3-38.  Query for LOB Statistics in sys.dm_db_index_operational_stats
SELECT OBJECT_SCHEMA_NAME(ios.object_id) + '.' + OBJECT_NAME(ios.object_id) as table_name
  ,i.name as index_name
  ,lob_fetch_in_pages
  ,lob_fetch_in_bytes
  ,lob_orphan_create_count
  ,lob_orphan_insert_count
  ,row_over?ow_fetch_in_pages
  ,row_over?ow_fetch_in_bytes
  ,column_value_push_off_row_count
  ,column_value_pull_in_row_count
FROM sys.dm_db_index_operational_stats (DB_ID(), OBJECT_ID('dbo.LOBAccess'), NULL, NULL) ios
INNER JOIN sys.indexes i ON i.object_id = ios.object_id AND i.index_id = ios.index_id
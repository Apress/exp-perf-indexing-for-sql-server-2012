--Listing 10-56.  Query for Unused Indexes
SELECT OBJECT_NAME(i.object_id) as table_name
  ,COALESCE(i.name, space(0)) as index_name
  ,ps.partition_number
  ,ps.row_count
  ,Cast((ps.reserved_page_count * 8)/1024. as decimal(12,2)) as size_in_mb
  ,COALESCE(ius.user_seeks,0) as user_seeks
  ,COALESCE(ius.user_scans,0) as user_scans
  ,COALESCE(ius.user_lookups,0) as user_lookups
  ,i.type_desc
FROM sys.all_objects t
  INNER JOIN sys.indexes i ON t.object_id = i.object_id
  INNER JOIN sys.dm_db_partition_stats ps ON i.object_id = ps.object_id AND i.index_id = ps.index_id
  LEFT OUTER JOIN sys.dm_db_index_usage_stats ius ON ius.database_id = db_id() AND i.object_id = ius.object_id AND i.index_id = ius.index_id
WHERE i.type_desc NOT IN ('HEAP', 'CLUSTERED')
AND i.is_unique = 0
AND i.is_primary_key = 0
AND i.is_unique_constraint = 0
AND COALESCE(ius.user_seeks,0) <= 0
AND COALESCE(ius.user_scans,0) <= 0
AND COALESCE(ius.user_lookups,0) <= 0
ORDER BY object_name(i.object_id), i.name
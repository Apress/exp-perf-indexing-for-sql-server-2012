--Listing 10-27.  FreeSpace Scans Snapshot Query
USE IndexingMethod
GO
SELECT
  QUOTENAME(DB_NAME(database_id)) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(object_id, database_id)) + '.'
    + QUOTENAME(OBJECT_NAME(object_id, database_id)) AS ObjectName
  , SUM(leaf_insert_count) AS leaf_insert_count
  , SUM(leaf_allocation_count) AS leaf_allocation_count
FROM dbo.index_operational_stats_history
WHERE index_id = 0
AND database_id > 4
GROUP BY object_id, database_id
ORDER BY leaf_insert_count DESC
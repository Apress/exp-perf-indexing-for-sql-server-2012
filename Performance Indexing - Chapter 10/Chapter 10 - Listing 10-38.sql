--Listing 10-38.  Lock Wait Time Snapshot Query
USE IndexingMethod
GO
SELECT
  QUOTENAME(DB_NAME(database_id)) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(object_id, database_id)) + '.'
    + QUOTENAME(OBJECT_NAME(object_id, database_id)) AS ObjectName
  ,index_id
  ,SUM(row_lock_wait_count) AS row_lock_wait_count
  ,SUM(row_lock_wait_in_ms) / 1000. AS row_lock_wait_in_sec
  ,ISNULL(SUM(row_lock_wait_in_ms)
    / NULLIF(SUM(row_lock_wait_count),0)
    / 1000.,0) AS avg_row_lock_wait_in_sec
  ,SUM(page_lock_wait_count) AS page_lock_wait_count
  ,SUM(page_lock_wait_in_ms) / 1000. AS page_lock_wait_in_sec
  ,ISNULL(SUM(page_lock_wait_in_ms)
    / NULLIF(SUM(page_lock_wait_count),0)
    / 1000.,0) AS avg_page_lock_wait_in_sec
FROM dbo.index_operational_stats_history oh
WHERE database_id > 4
AND (row_lock_wait_in_ms > 0 OR page_lock_wait_in_ms > 0)
GROUP BY database_id, object_id, index_id
--Listing 10-40.  Lock Waits Snapshot Query
USE IndexingMethod
GO
SELECT
  QUOTENAME(DB_NAME(database_id)) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(object_id, database_id)) + '.'
    + QUOTENAME(OBJECT_NAME(object_id, database_id)) AS ObjectName
  ,index_id
  ,SUM(row_lock_count) AS row_lock_count
  ,SUM(row_lock_wait_count) AS row_lock_wait_count
  ,ISNULL(SUM(row_lock_wait_count)
    / NULLIF(SUM(row_lock_count),0),0) AS pct_row_lock_wait
  ,SUM(page_lock_count) AS page_lock_count
  ,SUM(page_lock_wait_count) AS page_lock_wait_count
  ,ISNULL(SUM(page_lock_wait_count)
    / NULLIF(SUM(page_lock_count),0),0) AS pct_page_lock_wait
FROM dbo.index_operational_stats_history oh
WHERE database_id > 4
AND (row_lock_wait_in_ms > 0 OR page_lock_wait_in_ms > 0)
GROUP BY database_id, object_id, index_id
--Listing 10-34.  Page Splits Snapshot Query
USE IndexingMethod
GO
SELECT
  QUOTENAME(DB_NAME(database_id)) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(object_id, database_id)) + '.'
    + QUOTENAME(OBJECT_NAME(object_id, database_id)) AS ObjectName
  , SUM(leaf_allocation_count) AS leaf_insert_count
  , SUM(nonleaf_allocation_count) AS nonleaf_allocation_count
  , MAX(CASE WHEN RankID=1 THEN x.avg_fragmentation_in_percent END) AS last_fragmenation
  , AVG(x.avg_fragmentation_in_percent) AS average_fragmenation
FROM dbo.index_operational_stats_history oh
  CROSS APPLY (
    SELECT DENSE_RANK() OVER (ORDER BY ph.create_date DESC) AS RankID
      ,CAST(ph.avg_fragmentation_in_percent AS DECIMAL(6,3)) AS avg_fragmentation_in_percent
    FROM dbo.index_physical_stats_history ph
    WHERE ph.database_id = oh.database_id AND ph.object_id = oh.object_id AND ph.index_id = oh.index_id) x
WHERE database_id > 4
AND oh.index_id <> 0
AND (leaf_allocation_count > 0 OR nonleaf_allocation_count > 0)
GROUP BY object_id, database_id
ORDER BY leaf_insert_count DESC
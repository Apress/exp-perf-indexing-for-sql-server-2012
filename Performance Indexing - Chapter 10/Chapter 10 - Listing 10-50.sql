--Listing 10-50.  Query to Identify Heaps
SELECT
  QUOTENAME(DB_NAME()) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(i.object_id)) + '.'
    + QUOTENAME(OBJECT_NAME(i.object_id)) AS object_name
  ,i.index_id
  ,p.rows
  ,SUM(h.user_seeks) AS user_seeks
  ,SUM(h.user_scans) AS user_scans
  ,SUM(h.user_lookups) AS user_lookups
  ,SUM(h.user_updates) AS user_updates
FROM sys.indexes i
  INNER JOIN sys.partitions p ON i.index_id = p.index_id AND i.object_id = p.object_id
  LEFT OUTER JOIN IndexingMethod.dbo.index_usage_stats_history h ON p.object_id = h.object_id 
AND p.index_id = h.index_id
WHERE type_desc = 'HEAP'
GROUP BY i.index_id
  ,p.rows
  ,i.object_id
ORDER BY p.rows DESC
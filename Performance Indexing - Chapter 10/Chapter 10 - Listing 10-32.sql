--Listing 10-32.  Index Searches Snapshot Query
USE IndexingMethod
GO
SELECT QUOTENAME(DB_NAME(uh.database_id)) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(uh.object_id, uh.database_id)) + '.'
    + QUOTENAME(OBJECT_NAME(uh.object_id, uh.database_id)) AS ObjectName
  ,uh.index_id
  ,SUM(uh.user_scans) AS user_scans
  ,SUM(uh.user_seeks) AS user_seeks
  ,1.*SUM(uh.user_seeks)/NULLIF(SUM(uh.user_scans),0) AS SeekScanRatio
  ,x.record_count
FROM dbo.index_usage_stats_history uh
  CROSS APPLY (
    SELECT DENSE_RANK() OVER (ORDER BY ph.create_date DESC) AS RankID
      ,ph.record_count
    FROM dbo.index_physical_stats_history ph
    WHERE ph.database_id = uh.database_id AND ph.object_id = uh.object_id AND ph.index_id = 
uh.index_id) x
WHERE uh.database_id > 4
AND x.RankID = 1
AND x.record_count > 0
GROUP BY uh.database_id, uh.object_id, uh.index_id, x.record_count
HAVING 1.*SUM(uh.user_seeks)/NULLIF(SUM(uh.user_scans),0) < 1000
AND SUM(uh.user_seeks) > 0
ORDER BY 1.*SUM(uh.user_seeks)/NULLIF(SUM(uh.user_scans),0) DESC, SUM(uh.user_scans) DESC
GO
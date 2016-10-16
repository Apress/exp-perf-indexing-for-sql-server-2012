--Listing 3-15.  Query for System Columns in sys.dm_db_index_usage_stats
SELECT OBJECT_NAME(i.object_id) AS table_name
  ,i.name AS index_name
  ,ius.system_seeks
  ,ius.system_scans
  ,ius.system_lookups
  ,ius.system_updates
  ,ius.last_system_seek
  ,ius.last_system_scan
  ,ius.last_system_lookup
 ,ius.last_system_update
FROM sys.indexes i
  INNER JOIN sys.dm_db_index_usage_stats ius
         ON i.object_id = ius.object_id
         AND i.index_id = ius.index_id
         AND ius.database_id = DB_ID()
WHERE ius.object_id = OBJECT_ID('Sales.SalesOrderDetail')
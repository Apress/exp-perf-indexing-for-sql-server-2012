--Listing 3-7.  Query for index_seeks from sys.dm_db_index_usage_stats
USE AdventureWorks2012
GO
SELECT TOP 10
  OBJECT_NAME(i.object_id) AS table_name
  ,i.name AS index_name
  ,ius.user_seeks
  ,ius.last_user_seek
FROM sys.indexes i
  INNER JOIN sys.dm_db_index_usage_stats ius
         ON i.object_id = ius.object_id
         AND i.index_id = ius.index_id
         AND ius.database_id = DB_ID()
WHERE ius.object_id = OBJECT_ID('Sales.SalesOrderDetail')
 GO
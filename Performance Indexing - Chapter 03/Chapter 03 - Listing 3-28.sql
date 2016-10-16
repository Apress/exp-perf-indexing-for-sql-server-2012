--Listing 3-28.  Query for Page I/O Latch Statistics in sys.dm_db_index_operational_stats
SELECT OBJECT_SCHEMA_NAME(ios.object_id) + '.' + OBJECT_NAME(ios.object_id) as table_name
,i.name as index_name
,page_io_latch_wait_count
,page_io_latch_wait_in_ms
,CAST(1. * page_io_latch_wait_in_ms
  / NULLIF(page_io_latch_wait_count ,0) AS decimal(12,2)) AS page_io_avg_lock_wait_ms
FROM sys.dm_db_index_operational_stats (DB_ID(), NULL, NULL, NULL) ios
INNER JOIN sys.indexes i ON i.object_id = ios.object_id AND i.index_id = ios.index_id
WHERE i.object_id = OBJECT_ID('Sales.SalesOrderHeader')
OR i.object_id = OBJECT_ID('Sales.SalesOrderDetail')
OR i.object_id = OBJECT_ID('Production.Product')
ORDER BY 5 DESC
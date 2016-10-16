--Listing 3-18.  Query for range_scan_count from sys.dm_db_index_operational_stats
SELECT OBJECT_NAME(ios.object_id) AS table_name
    ,i.name AS index_name
    ,ios.range_scan_count
FROM sys.dm_db_index_operational_stats(DB_ID(),OBJECT_ID('Sales.SalesOrderDetail'),NULL,NULL) ios
     INNER JOIN sys.indexes i
       ON i.object_id = ios.object_id
         AND i.index_id = ios.index_id
ORDER BY ios.range_scan_count DESC
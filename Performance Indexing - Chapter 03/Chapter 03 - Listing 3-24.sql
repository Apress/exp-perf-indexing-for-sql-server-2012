--Listing 3-24.  Query for Page Locks in sys.dm_db_index_operational_stats
USE AdventureWorks2012
GO
SELECT OBJECT_NAME(ios.object_id) AS table_name
    ,i.name AS index_name
    ,ios.page_lock_count
    ,ios.page_lock_wait_count
    ,ios.page_lock_wait_in_ms
FROM sys.dm_db_index_operational_stats(DB_ID(),OBJECT_ID('Sales.SalesOrderDetail'),NULL,NULL) ios
    INNER JOIN sys.indexes i
      ON i.object_id = ios.object_id
        AND i.index_id = ios.index_id
ORDER BY ios.range_scan_count DESC
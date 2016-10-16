--Listing 3-19.  Query for singleton_lookup_count from sys.dm_db_index_operational_stats
SELECT OBJECT_NAME(ios.object_id) AS table_name
    ,i.name AS index_name
    ,ios.singleton_lookup_count
FROM sys.dm_db_index_operational_stats(DB_ID(),OBJECT_ID('Sales.SalesOrderDetail'),NULL,NULL) ios
     INNER JOIN sys.indexes i
       ON i.object_id = ios.object_id
         AND i.index_id = ios.index_id
ORDER BY ios. singleton_lookup_count DESC
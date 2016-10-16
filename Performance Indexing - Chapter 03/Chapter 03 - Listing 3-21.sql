--Listing 3-21.  Query for forwarded_fetch_count from sys.dm_db_index_operational_stats
SELECT OBJECT_NAME(ios.object_id) AS table_name
    ,i.name AS index_name
    ,ios.forwarded_fetch_count
FROM sys.dm_db_index_operational_stats(DB_ID(),OBJECT_ID('dbo.ForwardedRecords'),NULL,NULL) ios
    INNER JOIN sys.indexes i
      ON i.object_id = ios.object_id
         AND i.index_id = ios.index_id
ORDER BY ios.forwarded_fetch_count DESC
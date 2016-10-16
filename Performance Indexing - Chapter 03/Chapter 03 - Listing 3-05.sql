--Listing 3-5.  Query for Header Columns in sys.dm_db_index_usage_stats
USE AdventureWorks2012
GO
SELECT TOP 10 OBJECT_NAME(i.object_id) AS table_name
    ,i.name AS index_name
    ,ius.database_id
    ,ius.object_id
    ,ius.index_id
FROM sys.indexes i
    LEFT JOIN sys.dm_db_index_usage_stats ius
        ON i.object_id = ius.object_id
        AND i.index_id = ius.index_id
        AND ius.database_id = DB_ID()
WHERE ius.index_id IS NULL
AND OBJECTPROPERTY(i.object_id, 'IsUserTable') = 1
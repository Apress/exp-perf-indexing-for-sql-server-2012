--Listing 3-31.  Query for Page Latch Statistics in sys.dm_db_index_operational_stats
SELECT OBJECT_SCHEMA_NAME(ios.object_id) + '.' + OBJECT_NAME(ios.object_id) as table_name
,i.name as index_name
,page_latch_wait_count
,page_latch_wait_in_ms
,CAST(100. * page_latch_wait_in_ms
    / NULLIF(page_latch_wait_count ,0) AS decimal(12,2)) AS page_avg_lock_wait_ms
FROM sys.dm_db_index_operational_stats (DB_ID(), NULL, NULL, NULL) ios
INNER JOIN sys.indexes i ON i.object_id = ios.object_id AND i.index_id = ios.index_id
WHERE i.object_id = OBJECT_ID('dbo.PageLatchDemo')
OR i.object_id = OBJECT_ID('dbo.PageLatchDemo')
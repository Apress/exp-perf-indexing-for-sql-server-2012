--Listing 10-6.  Index Usage Stats Snapshot Population
USE IndexingMethod
GO
INSERT INTO dbo.index_usage_stats_snapshot
    SELECT GETDATE()
        ,database_id
        ,object_id
        ,index_id
        ,user_seeks
        ,user_scans
        ,user_lookups
        ,user_updates
        ,last_user_seek
        ,last_user_scan
        ,last_user_lookup
        ,last_user_update
        ,system_seeks
        ,system_scans
        ,system_lookups
        ,system_updates
        ,last_system_seek
        ,last_system_scan
        ,last_system_lookup
        ,last_system_update
    FROM  sys.dm_db_index_usage_stats
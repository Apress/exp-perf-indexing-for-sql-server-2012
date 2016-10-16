--Listing 10-7.  Index Usage Stats Snapshot Population
USE IndexingMethod
GO
WITH  IndexUsageCTE
     AS ( SELECT
        DENSE_RANK() OVER ( ORDER BY create_date DESC ) AS HistoryID
        ,create_date
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
        FROM
        dbo.index_usage_stats_snapshot
       )

INSERT INTO dbo.index_usage_stats_history
SELECT i1.create_date
  ,i1.database_id
  ,i1.object_id
  ,i1.index_id
  ,i1.user_seeks - COALESCE(i2.user_seeks, 0)
  ,i1.user_scans - COALESCE(i2.user_scans, 0)
  ,i1.user_lookups - COALESCE(i2.user_lookups, 0)
  ,i1.user_updates - COALESCE(i2.user_updates, 0)
  ,i1.last_user_seek
  ,i1.last_user_scan
  ,i1.last_user_lookup
  ,i1.last_user_update
  ,i1.system_seeks - COALESCE(i2.system_seeks, 0)
  ,i1.system_scans - COALESCE(i2.system_scans, 0)
  ,i1.system_lookups - COALESCE(i2.system_lookups, 0)
  ,i1.system_updates - COALESCE(i2.system_updates, 0)
  ,i1.last_system_seek
  ,i1.last_system_scan
  ,i1.last_system_lookup
  ,i1.last_system_update
FROM
  IndexUsageCTE i1
  LEFT OUTER JOIN IndexUsageCTE i2
        ON i1.database_id = i2.database_id
            AND i1.object_id = i2.object_id
            AND i1.index_id = i2.index_id
            AND i2.HistoryID = 2
            --Verify no rows are less than 0
            AND NOT ( i1.system_seeks - COALESCE(i2.system_seeks, 0) < 0
                AND i1.system_scans - COALESCE(i2.system_scans, 0) < 0
                AND i1.system_lookups - COALESCE(i2.system_lookups, 0) < 0
                AND i1.system_updates - COALESCE(i2.system_updates, 0) < 0
                AND i1.user_seeks - COALESCE(i2.user_seeks, 0) < 0
                AND i1.user_scans - COALESCE(i2.user_scans, 0) < 0
                AND i1.user_lookups - COALESCE(i2.user_lookups, 0) < 0
                AND i1.user_updates - COALESCE(i2.user_updates, 0) < 0
                )
WHERE
  i1.HistoryID = 1
--Only include rows are greater than 0
  AND ( i1.system_seeks - COALESCE(i2.system_seeks, 0) > 0
     OR i1.system_scans - COALESCE(i2.system_scans, 0) > 0
     OR i1.system_lookups - COALESCE(i2.system_lookups, 0) > 0
     OR i1.system_updates - COALESCE(i2.system_updates, 0) > 0
     OR i1.user_seeks - COALESCE(i2.user_seeks, 0) > 0
     OR i1.user_scans - COALESCE(i2.user_scans, 0) > 0
     OR i1.user_lookups - COALESCE(i2.user_lookups, 0) > 0
     OR i1.user_updates - COALESCE(i2.user_updates, 0) > 0
    )
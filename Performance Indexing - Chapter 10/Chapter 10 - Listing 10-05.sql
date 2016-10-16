--Listing 10-5.  Index Usage Stats Snapshot Tables Stats
USE IndexingMethod
GO
CREATE TABLE dbo.index_usage_stats_snapshot
  (
  snapshot_id INT IDENTITY(1,1)
  ,create_date DATETIME
  ,database_id SMALLINT NOT NULL
  ,object_id INT NOT NULL
  ,index_id INT NOT NULL
  ,user_seeks BIGINT NOT NULL
  ,user_scans BIGINT NOT NULL
  ,user_lookups BIGINT NOT NULL
  ,user_updates BIGINT NOT NULL
  ,last_user_seek DATETIME
  ,last_user_scan DATETIME
  ,last_user_lookup DATETIME
  ,last_user_update DATETIME
  ,system_seeks BIGINT NOT NULL
  ,system_scans BIGINT NOT NULL
  ,system_lookups BIGINT NOT NULL
  ,system_updates BIGINT NOT NULL
  ,last_system_seek DATETIME
  ,last_system_scan DATETIME
  ,last_system_lookup DATETIME
  ,last_system_update DATETIME
  ,CONSTRAINT PK_IndexUsageStatsSnapshot
    PRIMARY KEY CLUSTERED (snapshot_id)
  ,CONSTRAINT UQ_IndexUsageStatsSnapshot
    UNIQUE (create_date, database_id, object_id, index_id)
  );

  CREATE TABLE dbo.index_usage_stats_history
  (
  history_id INT IDENTITY(1,1)
  ,create_date DATETIME
  ,database_id SMALLINT NOT NULL
  ,object_id INT NOT NULL
  ,index_id INT NOT NULL
  ,user_seeks BIGINT NOT NULL
  ,user_scans BIGINT NOT NULL
  ,user_lookups BIGINT NOT NULL
  ,user_updates BIGINT NOT NULL
  ,last_user_seek DATETIME
  ,last_user_scan DATETIME
  ,last_user_lookup DATETIME
  ,last_user_update DATETIME
  ,system_seeks BIGINT NOT NULL
  ,system_scans BIGINT NOT NULL
  ,system_lookups BIGINT NOT NULL
  ,system_updates BIGINT NOT NULL
  ,last_system_seek DATETIME
  ,last_system_scan DATETIME
  ,last_system_lookup DATETIME
  ,last_system_update DATETIME
  ,CONSTRAINT PK_IndexUsageStatsHistory
    PRIMARY KEY CLUSTERED (history_id)
  ,CONSTRAINT UQ_IndexUsageStatsHistory
    UNIQUE (create_date, database_id, object_id, index_id)
  );  
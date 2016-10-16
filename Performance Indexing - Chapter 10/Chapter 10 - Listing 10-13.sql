--Listing 10-13.  Wait Statistics Snapshot and History Table
USE IndexingMethod
GO
CREATE TABLE dbo.wait_stats_snapshot
  (
   wait_stats_snapshot_id INT IDENTITY(1, 1)
  ,create_date DATETIME
  ,wait_type NVARCHAR(60) NOT NULL
  ,waiting_tasks_count BIGINT NOT NULL
  ,wait_time_ms BIGINT NOT NULL
  ,max_wait_time_ms BIGINT NOT NULL
  ,signal_wait_time_ms BIGINT NOT NULL
  ,CONSTRAINT PK_wait_stats_snapshot PRIMARY KEY CLUSTERED
    (wait_stats_snapshot_id)
  ) ;
CREATE TABLE dbo.wait_stats_history
  (
   wait_stats_history_id INT IDENTITY(1, 1)
  ,create_date DATETIME
  ,wait_type NVARCHAR(60) NOT NULL
  ,waiting_tasks_count BIGINT NOT NULL
  ,wait_time_ms BIGINT NOT NULL
  ,max_wait_time_ms BIGINT NOT NULL
  ,signal_wait_time_ms BIGINT NOT NULL
  ,CONSTRAINT PK_wait_stats_history PRIMARY KEY CLUSTERED
    (wait_stats_history_id)
  ) ;
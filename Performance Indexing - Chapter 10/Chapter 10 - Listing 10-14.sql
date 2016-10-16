--Listing 10-14.  Wait Statistics Snapshot Population
USE IndexingMethod
GO
INSERT INTO dbo.wait_stats_snapshot (
  create_date
  ,wait_type
  ,waiting_tasks_count
  ,wait_time_ms
  ,max_wait_time_ms
  ,signal_wait_time_ms)
SELECT GETDATE()
  ,wait_type
  ,waiting_tasks_count
  ,wait_time_ms
  ,max_wait_time_ms
  ,signal_wait_time_ms
FROM sys.dm_os_wait_stats
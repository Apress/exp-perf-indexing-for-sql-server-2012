--Listing 10-16.  Index Monitoring Snapshot and History Cleanup
USE IndexingMethod
GO
DECLARE @SnapshotDays INT = 3
  ,@HistoryDays INT = 90
DELETE FROM dbo.index_usage_stats_snapshot
WHERE create_date < DATEADD(d, -@SnapshotDays, GETDATE())
DELETE FROM dbo.index_usage_stats_history
WHERE create_date < DATEADD(d, -@HistoryDays, GETDATE())
DELETE FROM dbo.index_operational_stats_snapshot
WHERE create_date < DATEADD(d, -@SnapshotDays, GETDATE())
DELETE FROM dbo.index_operational_stats_history
WHERE create_date < DATEADD(d, -@HistoryDays, GETDATE())
DELETE FROM dbo.index_physical_stats_history
WHERE create_date < DATEADD(d, -@HistoryDays, GETDATE())
DELETE FROM dbo.wait_stats_snapshot
WHERE create_date < DATEADD(d, -@SnapshotDays, GETDATE())
DELETE FROM dbo.wait_stats_history
WHERE create_date < DATEADD(d, -@HistoryDays, GETDATE())
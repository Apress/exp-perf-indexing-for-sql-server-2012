--Listing 10-43.  Wait Statistics Analysis Query
USE IndexingMethod
GO
WITH WaitStats
AS (
  SELECT DENSE_RANK() OVER (ORDER BY w.create_date ASC) AS RankID
    ,create_date
    ,wait_type
    ,waiting_tasks_count
    ,wait_time_ms
    ,max_wait_time_ms
    ,signal_wait_time_ms
    ,MIN(create_date) OVER() AS min_create_date
    ,MAX(create_date) OVER() AS max_create_date
  FROM dbo.wait_stats_history w
  WHERE wait_type NOT IN ('CLR_SEMAPHORE','LAZYWRITER_SLEEP','RESOURCE_QUEUE'
  ,'SLEEP_TASK','SLEEP_SYSTEMTASK','SQLTRACE_BUFFER_FLUSH','WAITFOR'
  ,'LOGMGR_QUEUE','CHECKPOINT_QUEUE','REQUEST_FOR_DEADLOCK_SEARCH'
  ,'XE_TIMER_EVENT','BROKER_TO_FLUSH','BROKER_TASK_STOP','CLR_MANUAL_EVENT'
  ,'CLR_AUTO_EVENT','DISPATCHER_QUEUE_SEMAPHORE', 'FT_IFTS_SCHEDULER_IDLE_WAIT'
  ,'XE_DISPATCHER_WAIT', 'XE_DISPATCHER_JOIN', 'SQLTRACE_INCREMENTAL_FLUSH_SLEEP'
  ,'ONDEMAND_TASK_QUEUE', 'BROKER_EVENTHANDLER', 'SLEEP_BPOOL_FLUSH'
  ,'DIRTY_PAGE_POLL','HADR_FILESTREAM_IOMGR_IOCOMPLETION')
)
SELECT
  wait_type
  ,DATEDIFF(ms, min_create_date, max_create_date) AS total_time_ms
  ,SUM(waiting_tasks_count) AS waiting_tasks_count
  ,SUM(wait_time_ms) AS wait_time_ms
  ,CAST(1.*SUM(wait_time_ms)/SUM(waiting_tasks_count) AS DECIMAL(18,3)) AS avg_wait_time_ms
  ,CAST(100.*SUM(wait_time_ms)/DATEDIFF(ms, min_create_date, max_create_date) AS DECIMAL(18,3)) 
AS pct_time_in_wait
  ,SUM(signal_wait_time_ms) AS signal_wait_time_ms
  ,CAST(100.*SUM(signal_wait_time_ms)/NULLIF(SUM(wait_time_ms),0) AS DECIMAL(18,3)) AS pct_time_runnable
FROM WaitStats
WHERE RankID <> 1
GROUP BY wait_type, min_create_date, max_create_date
ORDER BY SUM(wait_time_ms) DESC
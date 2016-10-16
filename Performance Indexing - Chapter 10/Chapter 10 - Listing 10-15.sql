--Listing 10-15.  Wait Statistics History Population
USE IndexingMethod
GO
WITH  WaitStatCTE
     AS ( SELECT
        create_date
        ,DENSE_RANK() OVER ( ORDER BY create_date DESC ) AS HistoryID
        ,wait_type
        ,waiting_tasks_count
        ,wait_time_ms
        ,max_wait_time_ms
        ,signal_wait_time_ms
        FROM
        dbo.wait_stats_snapshot
       )
INSERT INTO dbo.wait_stats_history
SELECT
  w1.create_date
  ,w1.wait_type
  ,w1.waiting_tasks_count - COALESCE(w2.waiting_tasks_count, 0)
  ,w1.wait_time_ms - COALESCE(w2.wait_time_ms, 0)
  ,w1.max_wait_time_ms - COALESCE(w2.max_wait_time_ms, 0)
  ,w1.signal_wait_time_ms - COALESCE(w2.signal_wait_time_ms, 0)
FROM
  WaitStatCTE w1
  LEFT OUTER JOIN WaitStatCTE w2 ON w1.wait_type = w2.wait_type
    AND w1.waiting_tasks_count >= COALESCE(w2.waiting_tasks_count,0)
    AND w2.HistoryID = 2
WHERE
  w1.HistoryID = 1
  AND w1.waiting_tasks_count - COALESCE(w2.waiting_tasks_count, 0) > 0        
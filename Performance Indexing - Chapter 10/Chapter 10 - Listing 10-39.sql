--Listing 10-39.  Lock Waits Counter Analysis
USE IndexingMethod
GO
WITH CounterSummary
AS (
  SELECT create_date
    ,server_name
    ,instance_name
    ,MAX(CASE WHEN counter_name = 'Lock Waits/sec'
      THEN Calculated_Counter_value END) LockWaits
  FROM dbo.IndexingCounters
  WHERE counter_name = 'Lock Waits/sec'
  GROUP BY create_date
    ,server_name
    ,instance_name
)
SELECT
  CONVERT(VARCHAR(50), MAX(create_date), 101) AS CounterDate
  ,server_name
  ,instance_name
  ,MIN(LockWaits) AS MinLockWait
  ,AVG(LockWaits) AS AvgLockWait
  ,MAX(LockWaits) AS MaxLockWait
  ,STDEV(LockWaits) AS StdDevLockWait
FROM CounterSummary
GROUP BY server_name, instance_name
UNION ALL
SELECT 'Baseline: '+CONVERT(VARCHAR(50), start_date, 101)
  +' -->'+CONVERT(VARCHAR(50), end_date, 101)
  ,server_name
  ,instance_name
  ,minimum_counter_value/1000
  ,maximum_counter_value/1000
  ,average_counter_value/1000
  ,standard_deviation_counter_value/1000
FROM dbo.IndexingCountersBaseline
WHERE counter_name = 'Lock Waits/sec'
ORDER BY instance_name, CounterDate DESC
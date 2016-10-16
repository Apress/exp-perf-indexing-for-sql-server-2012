--Listing 10-41.  Number of Deadlocks Counter Analysis
USE IndexingMethod
GO
WITH CounterSummary
AS (
  SELECT create_date
    ,server_name
    ,Calculated_Counter_value AS NumberDeadlocks
  FROM dbo.IndexingCounters
  WHERE counter_name = 'Number of Deadlocks/sec'
)
SELECT server_name
  ,MIN(NumberDeadlocks) AS MinNumberDeadlocks
  ,AVG(NumberDeadlocks) AS AvgNumberDeadlocks
  ,MAX(NumberDeadlocks) AS MaxNumberDeadlocks
  ,STDEV(NumberDeadlocks) AS StdDevNumberDeadlocks
FROM CounterSummary
GROUP BY server_name
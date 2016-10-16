--Listing 10-28.  Full Scans Counter Analysis
USE IndexingMethod
GO
WITH CounterSummary
AS (
  SELECT create_date
    ,server_name
    ,MAX(CASE WHEN counter_name = 'Full Scans/sec'
      THEN Calculated_Counter_value END) FullScans
    ,MAX(CASE WHEN counter_name = 'Full Scans/sec'
      THEN Calculated_Counter_value END)
      / (NULLIF(MAX(CASE WHEN counter_name = 'Batch Requests/sec'
      THEN Calculated_Counter_value END),0) * 1000) AS FullRatio
  FROM dbo.IndexingCounters
  WHERE counter_name IN ('Full Scans/sec','Batch Requests/sec')
  GROUP BY create_date
    ,server_name
)
SELECT server_name
  ,MIN(FullScans) AS MinFullScans
  ,AVG(FullScans) AS AvgFullScans
  ,MAX(FullScans) AS MaxFullScans
  ,MIN(FullRatio) AS MinFullRatio
  ,AVG(FullRatio) AS AvgFullRatio
  ,MAX(FullRatio) AS MaxFullRatio
  ,100.*SUM(CASE WHEN FullRatio > 1 THEN 1 ELSE 0 END)/COUNT(*) AS PctViolation
FROM CounterSummary
GROUP BY server_name
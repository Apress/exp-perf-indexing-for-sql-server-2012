--Listing 10-22.  Forwarded Records Counter Analysis
USE IndexingMethod
GO
WITH CounterSummary
AS (
  SELECT create_date
    ,server_name
    ,MAX(CASE WHEN counter_name = 'Forwarded Records/sec'
      THEN Calculated_Counter_value END) ForwardedRecords
    ,MAX(CASE WHEN counter_name = 'Forwarded Records/sec'
      THEN Calculated_Counter_value END)
      / (NULLIF(MAX(CASE WHEN counter_name = 'Batch Requests/sec'
      THEN Calculated_Counter_value END),0) * 10) AS ForwardedRecordRatio
  FROM dbo.IndexingCounters
  WHERE counter_name IN ('Forwarded Records/sec','Batch Requests/sec')
  GROUP BY create_date
    ,server_name
)
SELECT server_name
  ,MIN(ForwardedRecords) AS MinForwardedRecords
  ,AVG(ForwardedRecords) AS AvgForwardedRecords
  ,MAX(ForwardedRecords) AS MaxForwardedRecords
  ,MIN(ForwardedRecordRatio) AS MinForwardedRecordRatio
  ,AVG(ForwardedRecordRatio) AS AvgForwardedRecordRatio
  ,MAX(ForwardedRecordRatio) AS MaxForwardedRecordRatio
  ,100.*SUM(CASE WHEN ForwardedRecordRatio > 1 THEN 1 END)
    /COUNT(*) AS PctViolation
FROM CounterSummary
GROUP BY server_name
--Listing 10-33.  Page Splits Counter Analysis
USE IndexingMethod
GO
WITH CounterSummary
AS (
  SELECT create_date
    ,server_name
    ,MAX(CASE WHEN counter_name = 'Page Splits/sec'
      THEN Calculated_Counter_value END) PageSplits
    ,MAX(CASE WHEN counter_name = 'Page Splits/sec'
      THEN Calculated_Counter_value END)
      / (NULLIF(MAX(CASE WHEN counter_name = 'Batch Requests/sec'
      THEN Calculated_Counter_value END),0) * 20) AS FullRatio
  FROM dbo.IndexingCounters
  WHERE counter_name IN ('Page Splits/sec','Batch Requests/sec')
  GROUP BY create_date
    ,server_name
)
SELECT server_name
  ,MIN(PageSplits) AS MinPageSplits
  ,AVG(PageSplits) AS AvgPageSplits
  ,MAX(PageSplits) AS MaxPageSplits
  ,MIN(FullRatio) AS MinFullRatio
  ,AVG(FullRatio) AS AvgFullRatio
  ,MAX(FullRatio) AS MaxFullRatio
  ,100.*SUM(CASE WHEN FullRatio > 1 THEN 1 ELSE 0 END)/COUNT(*) AS PctViolation
FROM CounterSummary
GROUP BY server_name
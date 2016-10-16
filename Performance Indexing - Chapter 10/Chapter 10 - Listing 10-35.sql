--Listing 10-35.  Page Lookups Counter Analysis
USE IndexingMethod
GO
WITH CounterSummary
AS (
  SELECT create_date
    ,server_name
    ,MAX(CASE WHEN counter_name = 'Page Lookups/sec'
      THEN Calculated_Counter_value END) PageLookups
    ,MAX(CASE WHEN counter_name = 'Page Lookups/sec'
      THEN Calculated_Counter_value END)
      / (NULLIF(MAX(CASE WHEN counter_name = 'Batch Requests/sec'
      THEN Calculated_Counter_value END),0) * 100) AS PageLookupRatio
  FROM dbo.IndexingCounters
  WHERE counter_name IN ('Page Lookups/sec','Batch Requests/sec')
  GROUP BY create_date
    ,server_name
)
SELECT server_name
  ,MIN(PageLookups) AS MinPageLookups
  ,AVG(PageLookups) AS AvgPageLookups
  ,MAX(PageLookups) AS MaxPageLookups
  ,MIN(PageLookupRatio) AS MinPageLookupRatio
  ,AVG(PageLookupRatio) AS AvgPageLookupRatio
  ,MAX(PageLookupRatio) AS MaxPageLookupRatio
  ,100.*SUM(CASE WHEN PageLookupRatio > 1 THEN 1 ELSE 0 END)/COUNT(*) AS PctViolation
FROM CounterSummary
GROUP BY server_name
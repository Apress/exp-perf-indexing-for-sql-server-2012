--Listing 10-31.  Index Searches Counter Analysis
USE IndexingMethod
GO
WITH CounterSummary
AS (
  SELECT create_date
    ,server_name
    ,MAX(CASE WHEN counter_name = 'Index Searches/sec'
      THEN Calculated_Counter_value END) IndexSearches
    ,MAX(CASE WHEN counter_name = 'Index Searches/sec'
      THEN Calculated_Counter_value END)
      / (NULLIF(MAX(CASE WHEN counter_name = 'Full Scans/sec'
      THEN Calculated_Counter_value END),0) * 1000) AS SearchToScanRatio
  FROM dbo.IndexingCounters
  WHERE counter_name IN ('Index Searches/sec','Full Scans/sec')
  GROUP BY create_date
    ,server_name
)
SELECT server_name
  ,MIN(IndexSearches) AS MinIndexSearches
  ,AVG(IndexSearches) AS AvgIndexSearches
  ,MAX(IndexSearches) AS MaxIndexSearches
  ,MIN(SearchToScanRatio) AS MinSearchToScanRatio
  ,AVG(SearchToScanRatio) AS AvgSearchToScanRatio
  ,MAX(SearchToScanRatio) AS MaxSearchToScanRatio
  ,100.*SUM(CASE WHEN SearchToScanRatio > 1 THEN 1 END)/COUNT(*) AS PctViolation
FROM CounterSummary
GROUP BY server_name
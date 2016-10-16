--Listing 10-24.  Forwarded Records Snapshot Query
IF OBJECT_ID('tempdb..#HeapList') IS NOT NULL
  DROP TABLE #HeapList
CREATE TABLE #HeapList
  (
   database_id int
  ,object_id int
  ,page_count INT
  ,avg_page_space_used_in_percent DECIMAL(6,3)
  ,record_count INT
  ,forwarded_record_count INT
  )
DECLARE HEAP_CURS CURSOR FORWARD_ONLY FOR
  SELECT object_id
  FROM sys.indexes i
  WHERE index_id = 0
DECLARE @IndexID INT
OPEN HEAP_CURS
FETCH NEXT FROM HEAP_CURS INTO @IndexID
WHILE @@FETCH_STATUS = 0
BEGIN
  INSERT INTO #HeapList
  SELECT
    DB_ID()
    ,object_id
    ,page_count
    ,CAST(avg_page_space_used_in_percent AS DECIMAL(6,3))
    ,record_count
    ,forwarded_record_count
  FROM
    sys.dm_db_index_physical_stats(DB_ID(), @IndexID, 0, NULL,'DETAILED') ;
  FETCH NEXT FROM HEAP_CURS INTO @IndexID
END
CLOSE HEAP_CURS
DEALLOCATE HEAP_CURS
SELECT
  QUOTENAME(DB_NAME(database_id))
  ,QUOTENAME(OBJECT_SCHEMA_NAME(object_id)) + '.'
    + QUOTENAME(OBJECT_NAME(object_id)) AS ObjectName
  ,page_count
  ,avg_page_space_used_in_percent
  ,record_count
  ,forwarded_record_count
  ,x.forwarded_fetch_count
  ,CAST(100.*forwarded_record_count/record_count AS DECIMAL(6,3)) AS forwarded_record_pct
  ,CAST(1.*x.forwarded_fetch_count/forwarded_record_count AS DECIMAL(12,3)) AS forwarded_row_ratio
FROM #HeapList h
  CROSS APPLY(
    SELECT SUM(forwarded_fetch_count) AS forwarded_fetch_count
    FROM IndexingMethod.dbo.index_operational_stats_history i
    WHERE h.database_id = i.database_id
    AND h.object_id = i.OBJECT_ID
    AND i.index_id = 0) x
WHERE forwarded_record_count > 0
ORDER BY page_count DESC  
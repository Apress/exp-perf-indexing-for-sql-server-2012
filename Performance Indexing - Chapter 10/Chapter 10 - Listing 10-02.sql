--Listing 10-2.  Performance Counter Snapshot Script
USE IndexingMethod
GO
IF OBJECT_ID('tempdb..#Delta') IS NOT NULL
  DROP TABLE #Delta
SELECT object_name
  ,counter_name
  ,instance_name
  ,cntr_value
INTO #Delta
FROM sys.dm_os_performance_counters opc
WHERE counter_name LIKE '%/sec%'
OR counter_name LIKE '%KB/s%';
WAITFOR DELAY '00:00:10'
INSERT INTO dbo.IndexingCounters
(create_date, server_name, object_name, counter_name, instance_name, Calculated_Counter_value)
SELECT GETDATE()
  ,LEFT(opc.object_name,CHARINDEX(':',opc.object_name)-1)
  ,SUBSTRING(opc.object_name,1+CHARINDEX(':',opc.object_name), LEN(opc.object_name))
  ,opc.counter_name
  ,opc.instance_name
  ,CASE WHEN opc.cntr_type = 537003264
   THEN CONVERT(FLOAT, opc.cntr_value) / coalesce(x.cntr_RatioBaseValue,-1)
   WHEN b.cntr_value IS NOT NULL
   THEN (opc.cntr_value - b.cntr_value)/5.
   ELSE opc.cntr_value -- The values of the other counter types are already calculated.
   END  as Calculated_Counter_value
FROM sys.dm_os_performance_counters opc
  LEFT OUTER JOIN (
   SELECT CASE cntr_value WHEN 0 THEN 1
      ELSE cntr_value END as cntr_RatioBaseValue
     ,SUBSTRING(counter_name, 1, PATINDEX('% Base%', counter_name)) as counter_name_?xed
     ,counter_name
     ,[object_name]
     ,instance_name
     ,cntr_type
   FROM sys.dm_os_performance_counters
   WHERE cntr_type = 1073939712 ) as x
     ON opc.counter_name = x.counter_name_?xed
     AND opc.[object_name] = x.[object_name]
     AND opc.instance_name = x.instance_name
  LEFT OUTER JOIN #Delta b
   ON opc.counter_name = b.counter_name
   AND opc.object_name = b.object_name
   AND opc.instance_name = b.instance_name
WHERE opc.cntr_type <> 1073939712
AND ((opc.[object_name] LIKE '%Access Methods%'
  AND (opc.counter_name LIKE '%Forwarded Records/sec';
  OR opc.counter_name LIKE '%FreeSpace Scans/sec%'
  OR opc.counter_name LIKE '%Full Scans/sec%'
  OR opc.counter_name LIKE '%Index Searches/sec%'
  OR opc.counter_name LIKE '%Page Splits/sec%'))
OR (opc.[object_name] LIKE '%Buffer Manager%'
  AND (opc.counter_name LIKE '%Page life expectancy%'
  OR opc.counter_name LIKE '%Page lookups/sec%'))
OR (opc.[object_name] LIKE '%Locks%'
  AND (opc.counter_name LIKE '%Lock Wait Time (ms)%'
  OR opc.counter_name LIKE '%Lock Waits/sec%'
  OR opc.counter_name LIKE '%Number of Deadlocks/sec%'))
OR (opc.[object_name] LIKE '%SQL Statistics%'
  AND opc.counter_name LIKE '%Batch Requests/sec%'))
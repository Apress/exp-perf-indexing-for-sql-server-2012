--Listing 10-47.  Query to View CXPACKET Extended Event Session
WITH XData AS (
  SELECT CAST(target_data AS xml) AS TargetData
  FROM sys.dm_xe_session_targets st
    INNER JOIN sys.dm_xe_sessions s ON s.address = st.event_session_address
  WHERE name = 'ex_cxpacket'
  AND target_name = 'histogram'
)
, ParsedEvent AS (
  SELECT c.value('(@count)[1]', 'bigint') as event_count
    ,c.value('xs:hexBinary(substring((value/frames/frame/@handle)[1],3))','varbinary(255)') AS 
sql_handle
    ,c.value('(value/frames/frame/@offsetStart)[1]','int') AS statement_start_offset
    ,c.value('(value/frames/frame/@offsetEnd)[1]','int') AS statement_end_offset
  FROM XData d
    CROSS APPLY TargetData.nodes('//Slot') t(c)
)
SELECT QUOTENAME(DB_NAME(st.dbid)) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(st.objectid, st.dbid)) + '.'
    + QUOTENAME(OBJECT_NAME(st.objectid, st.dbid)) AS object_name
  ,e.event_count
  ,SUBSTRING(st.text, e.statement_start_offset / 2,
    (CASE WHEN e.statement_end_offset = -1 THEN LEN(CONVERT(nvarchar(max), st.text)) * 2
    ELSE e.statement_end_offset END - e.statement_start_offset) / 2) AS query_text
  ,qp.query_plan
FROM ParsedEvent e
  CROSS APPLY sys.dm_exec_sql_text(e.sql_handle) st
  CROSS APPLY (
    SELECT plan_handle FROM sys.dm_exec_query_stats qs
    WHERE e.sql_handle = qs.sql_handle GROUP BY plan_handle) x
  CROSS APPLY sys.dm_exec_query_plan(x.plan_handle) qp
ORDER BY e.event_count DESC
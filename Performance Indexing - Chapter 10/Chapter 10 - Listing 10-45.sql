--Listing 10-45.  Parallel Queries Currently Executing
WITH executing
AS (
  SELECT er.session_id
    ,er.request_id
    ,MAX(ISNULL(exec_context_id, 0)) AS number_of_workers
    ,er.sql_handle
    ,er.statement_start_offset
    ,er.statement_end_offset
    ,er.plan_handle
  FROM sys.dm_exec_requests er
    INNER JOIN sys.dm_os_tasks t on er.session_id = t.session_id
    INNER JOIN sys.dm_exec_sessions es on er.session_id = es.session_id
  WHERE es.is_user_process = 0x1
  GROUP BY er.session_id
    ,er.request_id
    ,er.sql_handle
    ,er.statement_start_offset
    ,er.statement_end_offset
    ,er.plan_handle
)
SELECT QUOTENAME(DB_NAME(st.dbid)) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(st.objectid, st.dbid)) + '.'
    + QUOTENAME(OBJECT_NAME(st.objectid, st.dbid)) AS object_name
  ,e.session_id
  ,e.request_id
  ,e.number_of_workers
  ,SUBSTRING(st.text, e.statement_start_offset / 2,
    (CASE WHEN e.statement_end_offset = -1 THEN LEN(CONVERT(nvarchar(max), st.text)) * 2
    ELSE e.statement_end_offset END - e.statement_start_offset) / 2) AS query_text
  ,qp.query_plan
FROM executing e
  CROSS APPLY sys.dm_exec_sql_text(e.plan_handle) st
  CROSS APPLY sys.dm_exec_query_plan(e.plan_handle) qp
WHERE number_of_workers > 0;
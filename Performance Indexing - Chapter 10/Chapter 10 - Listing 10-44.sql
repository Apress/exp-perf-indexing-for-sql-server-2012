--Listing 10-44.  Execution Plans that Utilize Parallelism
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH XMLNAMESPACES (DEFAULT 'http://schemas.microsoft.com/sqlserver/2004/07/showplan')
SELECT COALESCE(DB_NAME(p.dbid)
    , p.query_plan.value('(//RelOp/OutputList/ColumnReference/@Database)[1]','nvarchar(128)'))
     AS database_name
  ,DB_NAME(p.dbid) + '.' + OBJECT_SCHEMA_NAME(p.objectid, p.dbid)
    + '.' + OBJECT_NAME(p.objectid, p.dbid) AS object_name
  ,cp.objtype
  ,p.query_plan
  ,cp.UseCounts AS use_counts
  ,cp.plan_handle
  ,CAST('<?query --' + CHAR(13) + q.text + CHAR(13) + '--?>' AS xml) AS sql_text
FROM sys.dm_exec_cached_plans cp
CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) p
CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) as q
WHERE cp.cacheobjtype = 'Compiled Plan'
AND p.query_plan.exist('//RelOp[@Parallel = "1"]') = 1
ORDER BY COALESCE(DB_NAME(p.dbid), p.query_plan.value('(//RelOp/OutputList/ColumnReference/@
Database)[1]','nvarchar(128)')), UseCounts DESC
--Listing 10-58.  Query Plan Cache for Index Usage and Physical Operation
DECLARE @IndexName sysname = 'IX_SalesOrderHeader_SalesPersonID';
DECLARE @op sysname = 'Index Scan';
;WITH XMLNAMESPACES(DEFAULT N'http://schemas.microsoft.com/sqlserver/2004/07/showplan')
SELECT
    cp.plan_handle
    ,DB_NAME(dbid) + '.' + OBJECT_SCHEMA_NAME(objectid, dbid) + '.' + OBJECT_NAME(objectid, 
dbid) AS database_object
  ,qp.query_plan
  ,c1.value('@PhysicalOp','nvarchar(50)')
  ,c2.value('@Index','nvarchar(max)')
FROM sys.dm_exec_cached_plans cp
  CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) qp
  CROSS APPLY query_plan.nodes('//RelOp') r(c1)
  OUTER APPLY c1.nodes('IndexScan/Object') as o(c2)
WHERE c2.value('@Index','nvarchar(max)') = QUOTENAME(@IndexName,'[')
AND c1.exist('@PhysicalOp[. = sql:variable("@op")]') = 1
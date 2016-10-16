--Listing 10-49.  Buffer Allocation by Table/Index
WITH BufferAllocation AS (
  SELECT object_id
    ,index_id
    ,allocation_unit_id
  FROM  sys.allocation_units AS au
    INNER JOIN sys.partitions AS p ON au.container_id = p.hobt_id AND (au.type = 1 OR au.type = 3)
  UNION ALL
  SELECT  object_id
    ,index_id
    ,allocation_unit_id
  FROM  sys.allocation_units AS au
    INNER JOIN sys.partitions AS p ON au.container_id = p.hobt_id AND au.type = 2
)
SELECT  t.name
    ,i.name
    ,i.type_desc
    ,COUNT(*) AS Buffered_Page_Count
    ,CAST(COUNT(*) * 8 / 1024.0 AS NUMERIC(10,2)) AS Buffer_MB
FROM sys.tables t
  INNER JOIN BufferAllocation ba ON t.object_id = ba.object_id
  LEFT JOIN sys.indexes i ON ba.object_id = i.object_id AND ba.index_id = i.index_id
  INNER JOIN sys.dm_os_buffer_descriptors bd ON ba.allocation_unit_id = bd.allocation_unit_id
WHERE bd.database_id = DB_ID()
GROUP BY t.name
  ,i.index_id
  ,i.name
  ,i.type_desc
ORDER BY Buffered_Page_Count DESC  
--Listing 6-24.  Script to Identify Fragmented Indexes
SELECT QUOTENAME(x.SchemaName)+'.'+QUOTENAME(x.TableName)
  ,CASE WHEN x.type_desc = 'CLUSTERED' THEN 'ALL'
    ELSE QUOTENAME(x.IndexName) END
  ,x.avg_fragmentation_in_percent
FROM  @FragmentationState
LEFT OUTER JOIN @FragmentationState y ON x.object_id = y.object_id AND y.index_id = 1
WHERE  (
       x.type_desc = 'CLUSTERED'
       AND y.type_desc = 'CLUSTERED'
       )
       OR y.index_id IS NULL
ORDER BY x.object_id
    ,x.index_id
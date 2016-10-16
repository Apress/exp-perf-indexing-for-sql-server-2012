--Listing 6-23.  Script to Collect Fragmenation Data
SELECT
  s.name as SchemaName
  ,t.name as TableName
  ,t.object_id
  ,i.name as IndexName
  ,i.index_id
  ,x.page_count
  ,x.avg_fragmentation_in_percent
  ,x.avg_page_space_used_in_percent
  ,i.type_desc
FROM sys.dm_db_index_physical_stats(db_id(), NULL, NULL, NULL, 'SAMPLED') x
  INNER JOIN sys.tables t ON x.object_id = t.object_id
  INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
  INNER JOIN sys.indexes i ON x.object_id = i.object_id AND x.index_id = i.index_id
WHERE x.index_id > 0
AND alloc_unit_type_desc = 'IN_ROW_DATA'
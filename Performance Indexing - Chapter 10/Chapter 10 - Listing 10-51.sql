--Listing 10-51.  Query to Identify Duplicate Indexes
WITH IndexSchema AS (
  SELECT i.object_id
      ,i.index_id
      ,i.name
      ,(SELECT CASE key_ordinal WHEN 0 THEN NULL ELSE QUOTENAME(column_id,'(') END
          FROM sys.index_columns ic
          WHERE ic.object_id = i.object_id
          AND ic.index_id = i.index_id
          ORDER BY key_ordinal, column_id
          FOR XML PATH('')) AS index_columns_keys
      ,(SELECT CASE key_ordinal WHEN 0 THEN QUOTENAME(column_id,';(') ELSE NULL END
          FROM sys.index_columns ic
          WHERE ic.object_id = i.object_id
          AND ic.index_id = i.index_id
          ORDER BY column_id
          FOR XML PATH('')) AS included_columns
  FROM sys.tables t
    INNER JOIN sys.indexes i ON t.object_id = i.object_id
  WHERE i.type_desc IN ('NONCLUSTERED', 'HEAP')
)
SELECT QUOTENAME(DB_NAME()) AS database_name
  ,QUOTENAME(OBJECT_SCHEMA_NAME(is1.object_id)) + '.'
    + QUOTENAME(OBJECT_NAME(is1.object_id)) AS object_name
    ,STUFF((SELECT ', ' + c.name
        FROM sys.index_columns ic
            INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
        WHERE ic.object_id = is1.object_id
        AND ic.index_id = is1.index_id
        ORDER BY ic.key_ordinal, ic.column_id
        FOR XML PATH('')),1,2,'') AS index_columns
    ,is1.name as index_name
  ,SUM(CASE WHEN is1.index_id = h.index_id THEN
    ISNULL(h.user_seeks,0)+ISNULL(h.user_scans,0)+ISNULL(h.user_lookups,0)+ISNULL(h.user_updates,0) END) index_activity
    ,is2.name as duplicate_index_name
  ,SUM(CASE WHEN is2.index_id = h.index_id THEN
    ISNULL(h.user_seeks,0)+ISNULL(h.user_scans,0)+ISNULL(h.user_lookups,0)+ISNULL(h.user_updates,0) END) duplicate_index_activity
FROM IndexSchema is1
    INNER JOIN IndexSchema is2 ON is1.object_id = is2.object_id
    AND is1.index_id > is2.index_id
    AND is1.index_columns_keys = is2.index_columns_keys
    AND is1.included_columns = is2.included_columns
  LEFT OUTER JOIN IndexingMethod.dbo.index_usage_stats_history h ON is1.object_id = h.object_id
GROUP BY is1.object_id, is1.name, is2.name, is1.index_id
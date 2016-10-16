--Listing 10-11.  Index Physical Stats History Table
USE IndexingMethod
GO
CREATE TABLE dbo.index_physical_stats_history
  (
  history_id INT IDENTITY(1,1)
  ,create_date DATETIME
  ,database_id SMALLINT
  ,object_id INT
  ,index_id INT
  ,partition_number INT
  ,index_type_desc NVARCHAR(60)
  ,alloc_unit_type_desc NVARCHAR(60)
  ,index_depth TINYINT
  ,index_level TINYINT
  ,avg_fragmentation_in_percent FLOAT
  ,fragment_count BIGINT
  ,avg_fragment_size_in_pages FLOAT
  ,page_count BIGINT
  ,avg_page_space_used_in_percent FLOAT
  ,record_count BIGINT
  ,ghost_record_count BIGINT
  ,version_ghost_record_count BIGINT
  ,min_record_size_in_bytes INT
  ,max_record_size_in_bytes INT
  ,avg_record_size_in_bytes FLOAT
  ,forwarded_record_count BIGINT
  ,compressed_page_count BIGINT
  ,CONSTRAINT PK_IndexPhysicalStatsHistory PRIMARY KEY CLUSTERED (history_id)
  ,CONSTRAINT UQ_IndexPhysicalStatsHistory UNIQUE (create_date, database_id, object_id, index_
id, partition_number, alloc_unit_type_desc, index_depth, index_level)
  ) ;
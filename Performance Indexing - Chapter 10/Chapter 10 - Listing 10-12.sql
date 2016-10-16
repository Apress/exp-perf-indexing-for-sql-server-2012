--Listing 10-12.  Index Physical Stats History Population
USE IndexingMethod
GO
DECLARE @DatabaseID INT
DECLARE DatabaseList CURSOR FAST_FORWARD FOR
  SELECT database_id
  FROM sys.databases
  WHERE state_desc = 'ONLINE';
OPEN DatabaseList
FETCH NEXT FROM DatabaseList INTO @DatabaseID;
WHILE @@FETCH_STATUS = 0
BEGIN
  INSERT INTO dbo.index_physical_stats_history
    (create_date, database_id, object_id, index_id, partition_number
    , index_type_desc, alloc_unit_type_desc, index_depth, index_level
    , avg_fragmentation_in_percent, fragment_count, avg_fragment_size_in_pages
    , page_count, avg_page_space_used_in_percent, record_count
    , ghost_record_count, version_ghost_record_count, min_record_size_in_bytes
    , max_record_size_in_bytes, avg_record_size_in_bytes, forwarded_record_count
    , compressed_page_count)
  SELECT
    GETDATE()
    ,database_id
    ,object_id
    ,index_id
    ,partition_number
    ,index_type_desc
    ,alloc_unit_type_desc
    ,index_depth
    ,index_level
    ,avg_fragmentation_in_percent
    ,fragment_count
    ,avg_fragment_size_in_pages
    ,page_count
    ,avg_page_space_used_in_percent
    ,record_count
    ,ghost_record_count
    ,version_ghost_record_count
    ,min_record_size_in_bytes
    ,max_record_size_in_bytes
    ,avg_record_size_in_bytes
    ,forwarded_record_count
    ,compressed_page_count
  FROM sys.dm_db_index_physical_stats(@DatabaseID, NULL, NULL, NULL, 'SAMPLED')
  FETCH NEXT FROM DatabaseList INTO @DatabaseID;
END
CLOSE DatabaseList
DEALLOCATE DatabaseList
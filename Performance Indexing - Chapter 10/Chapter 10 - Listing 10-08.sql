--Listing 10-8.  Index Operational Stats Snapshot Tables Stats
USE IndexingMethod
GO
CREATE TABLE dbo.index_operational_stats_snapshot (
  snapshot_id INT IDENTITY(1,1)
  ,create_date DATETIME
  ,database_id SMALLINT NOT NULL
  ,object_id INT NOT NULL
  ,index_id INT NOT NULL
  ,partition_number INT NOT NULL
  ,leaf_insert_count BIGINT NOT NULL
  ,leaf_delete_count BIGINT NOT NULL
  ,leaf_update_count BIGINT NOT NULL
  ,leaf_ghost_count BIGINT NOT NULL
  ,nonleaf_insert_count BIGINT NOT NULL
  ,nonleaf_delete_count BIGINT NOT NULL
  ,nonleaf_update_count BIGINT NOT NULL
  ,leaf_allocation_count BIGINT NOT NULL
  ,nonleaf_allocation_count BIGINT NOT NULL
  ,leaf_page_merge_count BIGINT NOT NULL
  ,nonleaf_page_merge_count BIGINT NOT NULL
  ,range_scan_count BIGINT NOT NULL
  ,singleton_lookup_count BIGINT NOT NULL
  ,forwarded_fetch_count BIGINT NOT NULL
  ,lob_fetch_in_pages BIGINT NOT NULL
  ,lob_fetch_in_bytes BIGINT NOT NULL
  ,lob_orphan_create_count BIGINT NOT NULL
  ,lob_orphan_insert_count BIGINT NOT NULL
  ,row_over?ow_fetch_in_pages BIGINT NOT NULL
  ,row_over?ow_fetch_in_bytes BIGINT NOT NULL
  ,column_value_push_off_row_count BIGINT NOT NULL
  ,column_value_pull_in_row_count BIGINT NOT NULL
  ,row_lock_count BIGINT NOT NULL
  ,row_lock_wait_count BIGINT NOT NULL
  ,row_lock_wait_in_ms BIGINT NOT NULL
  ,page_lock_count BIGINT NOT NULL
  ,page_lock_wait_count BIGINT NOT NULL
  ,page_lock_wait_in_ms BIGINT NOT NULL
  ,index_lock_promotion_attempt_count BIGINT NOT NULL
  ,index_lock_promotion_count BIGINT NOT NULL
  ,page_latch_wait_count BIGINT NOT NULL
  ,page_latch_wait_in_ms BIGINT NOT NULL
  ,page_io_latch_wait_count BIGINT NOT NULL
  ,page_io_latch_wait_in_ms BIGINT NOT NULL
  ,tree_page_latch_wait_count BIGINT NOT NULL
  ,tree_page_latch_wait_in_ms BIGINT NOT NULL
  ,tree_page_io_latch_wait_count BIGINT NOT NULL
  ,tree_page_io_latch_wait_in_ms BIGINT NOT NULL
  ,page_compression_attempt_count BIGINT NOT NULL
  ,page_compression_success_count BIGINT NOT NULL
  ,CONSTRAINT PK_IndexOperationalStatsSnapshot
    PRIMARY KEY CLUSTERED (snapshot_id)
  ,CONSTRAINT UQ_IndexOperationalStatsSnapshot
    UNIQUE (create_date, database_id, object_id, index_id, partition_number)
  );
CREATE TABLE dbo.index_operational_stats_history (
  history_id INT IDENTITY(1,1)
  ,create_date DATETIME
  ,database_id SMALLINT NOT NULL
  ,object_id INT NOT NULL
  ,index_id INT NOT NULL
  ,partition_number INT NOT NULL
  ,leaf_insert_count BIGINT NOT NULL
  ,leaf_delete_count BIGINT NOT NULL
  ,leaf_update_count BIGINT NOT NULL
  ,leaf_ghost_count BIGINT NOT NULL
  ,nonleaf_insert_count BIGINT NOT NULL
  ,nonleaf_delete_count BIGINT NOT NULL
  ,nonleaf_update_count BIGINT NOT NULL
  ,leaf_allocation_count BIGINT NOT NULL
  ,nonleaf_allocation_count BIGINT NOT NULL
  ,leaf_page_merge_count BIGINT NOT NULL
  ,nonleaf_page_merge_count BIGINT NOT NULL
  ,range_scan_count BIGINT NOT NULL
  ,singleton_lookup_count BIGINT NOT NULL
  ,forwarded_fetch_count BIGINT NOT NULL
  ,lob_fetch_in_pages BIGINT NOT NULL
  ,lob_fetch_in_bytes BIGINT NOT NULL
  ,lob_orphan_create_count BIGINT NOT NULL
  ,lob_orphan_insert_count BIGINT NOT NULL
  ,row_over?ow_fetch_in_pages BIGINT NOT NULL
  ,row_over?ow_fetch_in_bytes BIGINT NOT NULL
  ,column_value_push_off_row_count BIGINT NOT NULL
  ,column_value_pull_in_row_count BIGINT NOT NULL
  ,row_lock_count BIGINT NOT NULL
  ,row_lock_wait_count BIGINT NOT NULL
  ,row_lock_wait_in_ms BIGINT NOT NULL
  ,page_lock_count BIGINT NOT NULL
  ,page_lock_wait_count BIGINT NOT NULL
  ,page_lock_wait_in_ms BIGINT NOT NULL
  ,index_lock_promotion_attempt_count BIGINT NOT NULL
  ,index_lock_promotion_count BIGINT NOT NULL
  ,page_latch_wait_count BIGINT NOT NULL
  ,page_latch_wait_in_ms BIGINT NOT NULL
  ,page_io_latch_wait_count BIGINT NOT NULL
  ,page_io_latch_wait_in_ms BIGINT NOT NULL
  ,tree_page_latch_wait_count BIGINT NOT NULL
  ,tree_page_latch_wait_in_ms BIGINT NOT NULL
  ,tree_page_io_latch_wait_count BIGINT NOT NULL
  ,tree_page_io_latch_wait_in_ms BIGINT NOT NULL
  ,page_compression_attempt_count BIGINT NOT NULL
  ,page_compression_success_count BIGINT NOT NULL
  ,CONSTRAINT PK_IndexOperationalStatsHistory
    PRIMARY KEY CLUSTERED (history_id)
  ,CONSTRAINT UQ_IndexOperationalStatsHistory
    UNIQUE (create_date, database_id, object_id, index_id, partition_number)
  );  
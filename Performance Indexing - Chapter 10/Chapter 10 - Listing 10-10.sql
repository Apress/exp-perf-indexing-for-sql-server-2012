--Listing 10-10.  Index Operational Stats Snapshot Population
USE IndexingMethod
GO
WITH IndexOperationalCTE
AS ( SELECT
  DENSE_RANK() OVER ( ORDER BY create_date DESC ) AS HistoryID
  ,create_date
  ,database_id
  ,object_id
  ,index_id
  ,partition_number
  ,leaf_insert_count
  ,leaf_delete_count
  ,leaf_update_count
  ,leaf_ghost_count
  ,nonleaf_insert_count
  ,nonleaf_delete_count
  ,nonleaf_update_count
  ,leaf_allocation_count
  ,nonleaf_allocation_count
  ,leaf_page_merge_count
  ,nonleaf_page_merge_count
  ,range_scan_count
  ,singleton_lookup_count
  ,forwarded_fetch_count
  ,lob_fetch_in_pages
  ,lob_fetch_in_bytes
  ,lob_orphan_create_count
  ,lob_orphan_insert_count
  ,row_over?ow_fetch_in_pages
  ,row_over?ow_fetch_in_bytes
  ,column_value_push_off_row_count
  ,column_value_pull_in_row_count
  ,row_lock_count
  ,row_lock_wait_count
  ,row_lock_wait_in_ms
  ,page_lock_count
  ,page_lock_wait_count
  ,page_lock_wait_in_ms
  ,index_lock_promotion_attempt_count
  ,index_lock_promotion_count
  ,page_latch_wait_count
  ,page_latch_wait_in_ms
  ,page_io_latch_wait_count
  ,page_io_latch_wait_in_ms
  ,tree_page_latch_wait_count
  ,tree_page_latch_wait_in_ms
  ,tree_page_io_latch_wait_count
  ,tree_page_io_latch_wait_in_ms
  ,page_compression_attempt_count
  ,page_compression_success_count
  FROM
  dbo.index_operational_stats_snapshot
  )
INSERT INTO dbo.index_operational_stats_history
SELECT i1.create_date
  ,i1.database_id
  ,i1.object_id
  ,i1.index_id
  ,i1.partition_number
  ,i1.leaf_insert_count - COALESCE(i2.leaf_insert_count, 0)
  ,i1.leaf_delete_count - COALESCE(i2.leaf_delete_count, 0)
  ,i1.leaf_update_count - COALESCE(i2.leaf_update_count, 0)
  ,i1.leaf_ghost_count - COALESCE(i2.leaf_ghost_count, 0)
  ,i1.nonleaf_insert_count - COALESCE(i2.nonleaf_insert_count, 0)
  ,i1.nonleaf_delete_count - COALESCE(i2.nonleaf_delete_count, 0)
  ,i1.nonleaf_update_count - COALESCE(i2.nonleaf_update_count, 0)
  ,i1.leaf_allocation_count - COALESCE(i2.leaf_allocation_count, 0)
  ,i1.nonleaf_allocation_count - COALESCE(i2.nonleaf_allocation_count, 0)
  ,i1.leaf_page_merge_count - COALESCE(i2.leaf_page_merge_count, 0)
  ,i1.nonleaf_page_merge_count - COALESCE(i2.nonleaf_page_merge_count, 0)
  ,i1.range_scan_count - COALESCE(i2.range_scan_count, 0)
  ,i1.singleton_lookup_count - COALESCE(i2.singleton_lookup_count, 0)
  ,i1.forwarded_fetch_count - COALESCE(i2.forwarded_fetch_count, 0)
  ,i1.lob_fetch_in_pages - COALESCE(i2.lob_fetch_in_pages, 0)
  ,i1.lob_fetch_in_bytes - COALESCE(i2.lob_fetch_in_bytes, 0)
  ,i1.lob_orphan_create_count - COALESCE(i2.lob_orphan_create_count, 0)
  ,i1.lob_orphan_insert_count - COALESCE(i2.lob_orphan_insert_count, 0)
  ,i1.row_over?ow_fetch_in_pages - COALESCE(i2.row_over?ow_fetch_in_pages, 0)
  ,i1.row_over?ow_fetch_in_bytes - COALESCE(i2.row_over?ow_fetch_in_bytes, 0)
  ,i1.column_value_push_off_row_count - COALESCE(i2.column_value_push_off_row_count, 0)
  ,i1.column_value_pull_in_row_count - COALESCE(i2.column_value_pull_in_row_count, 0)
  ,i1.row_lock_count - COALESCE(i2.row_lock_count, 0)
  ,i1.row_lock_wait_count - COALESCE(i2.row_lock_wait_count, 0)
  ,i1.row_lock_wait_in_ms - COALESCE(i2.row_lock_wait_in_ms, 0)
  ,i1.page_lock_count - COALESCE(i2.page_lock_count, 0)
  ,i1.page_lock_wait_count - COALESCE(i2.page_lock_wait_count, 0)
  ,i1.page_lock_wait_in_ms - COALESCE(i2.page_lock_wait_in_ms, 0)
  ,i1.index_lock_promotion_attempt_count - COALESCE(i2.index_lock_promotion_attempt_count, 0)
  ,i1.index_lock_promotion_count - COALESCE(i2.index_lock_promotion_count, 0)
  ,i1.page_latch_wait_count - COALESCE(i2.page_latch_wait_count, 0)
  ,i1.page_latch_wait_in_ms - COALESCE(i2.page_latch_wait_in_ms, 0)
  ,i1.page_io_latch_wait_count - COALESCE(i2.page_io_latch_wait_count, 0)
  ,i1.page_io_latch_wait_in_ms - COALESCE(i2.page_io_latch_wait_in_ms, 0)
  ,i1.tree_page_latch_wait_count - COALESCE(i2.tree_page_latch_wait_count, 0)
  ,i1.tree_page_latch_wait_in_ms - COALESCE(i2.tree_page_latch_wait_in_ms, 0)
  ,i1.tree_page_io_latch_wait_count - COALESCE(i2.tree_page_io_latch_wait_count, 0)
  ,i1.tree_page_io_latch_wait_in_ms - COALESCE(i2.tree_page_io_latch_wait_in_ms, 0)
  ,i1.page_compression_attempt_count - COALESCE(i2.page_compression_attempt_count, 0)
  ,i1.page_compression_success_count - COALESCE(i2.page_compression_success_count, 0)
FROM IndexOperationalCTE i1
LEFT OUTER JOIN IndexOperationalCTE i2
    ON i1.database_id = i2.database_id
    AND i1.object_id = i2.object_id
    AND i1.index_id = i2.index_id
  AND i1.partition_number = i2.partition_number
    AND i2.HistoryID = 2
--Verify no rows are less than 0
AND NOT ( i1.leaf_insert_count - COALESCE(i2.leaf_insert_count, 0) < 0
  AND i1.leaf_delete_count - COALESCE(i2.leaf_delete_count, 0) < 0
  AND i1.leaf_update_count - COALESCE(i2.leaf_update_count, 0) < 0
  AND i1.leaf_ghost_count - COALESCE(i2.leaf_ghost_count, 0) < 0
  AND i1.nonleaf_insert_count - COALESCE(i2.nonleaf_insert_count, 0) < 0
  AND i1.nonleaf_delete_count - COALESCE(i2.nonleaf_delete_count, 0) < 0
  AND i1.nonleaf_update_count - COALESCE(i2.nonleaf_update_count, 0) < 0
  AND i1.leaf_allocation_count - COALESCE(i2.leaf_allocation_count, 0) < 0
  AND i1.nonleaf_allocation_count - COALESCE(i2.nonleaf_allocation_count, 0) < 0
  AND i1.leaf_page_merge_count - COALESCE(i2.leaf_page_merge_count, 0) < 0
  AND i1.nonleaf_page_merge_count - COALESCE(i2.nonleaf_page_merge_count, 0) < 0
  AND i1.range_scan_count - COALESCE(i2.range_scan_count, 0) < 0
  AND i1.singleton_lookup_count - COALESCE(i2.singleton_lookup_count, 0) < 0
  AND i1.forwarded_fetch_count - COALESCE(i2.forwarded_fetch_count, 0) < 0
  AND i1.lob_fetch_in_pages - COALESCE(i2.lob_fetch_in_pages, 0) < 0
  AND i1.lob_fetch_in_bytes - COALESCE(i2.lob_fetch_in_bytes, 0) < 0
  AND i1.lob_orphan_create_count - COALESCE(i2.lob_orphan_create_count, 0) < 0
  AND i1.lob_orphan_insert_count - COALESCE(i2.lob_orphan_insert_count, 0) < 0
  AND i1.row_over?ow_fetch_in_pages - COALESCE(i2.row_over?ow_fetch_in_pages, 0) < 0
  AND i1.row_over?ow_fetch_in_bytes - COALESCE(i2.row_over?ow_fetch_in_bytes, 0) < 0
  AND i1.column_value_push_off_row_count - COALESCE(i2.column_value_push_off_row_count, 0) < 0
  AND i1.column_value_pull_in_row_count - COALESCE(i2.column_value_pull_in_row_count, 0) < 0
  AND i1.row_lock_count - COALESCE(i2.row_lock_count, 0) < 0
  AND i1.row_lock_wait_count - COALESCE(i2.row_lock_wait_count, 0) < 0
  AND i1.row_lock_wait_in_ms - COALESCE(i2.row_lock_wait_in_ms, 0) < 0
  AND i1.page_lock_count - COALESCE(i2.page_lock_count, 0) < 0
  AND i1.page_lock_wait_count - COALESCE(i2.page_lock_wait_count, 0) < 0
  AND i1.page_lock_wait_in_ms - COALESCE(i2.page_lock_wait_in_ms, 0) < 0
  AND i1.index_lock_promotion_attempt_count - COALESCE(i2.index_lock_promotion_attempt_count, 0) < 0
  AND i1.index_lock_promotion_count - COALESCE(i2.index_lock_promotion_count, 0) < 0
  AND i1.page_latch_wait_count - COALESCE(i2.page_latch_wait_count, 0) < 0
  AND i1.page_latch_wait_in_ms - COALESCE(i2.page_latch_wait_in_ms, 0) < 0
  AND i1.page_io_latch_wait_count - COALESCE(i2.page_io_latch_wait_count, 0) < 0
  AND i1.page_io_latch_wait_in_ms - COALESCE(i2.page_io_latch_wait_in_ms, 0) < 0
  AND i1.tree_page_latch_wait_count - COALESCE(i2.tree_page_latch_wait_count, 0) < 0
  AND i1.tree_page_latch_wait_in_ms - COALESCE(i2.tree_page_latch_wait_in_ms, 0) < 0
  AND i1.tree_page_io_latch_wait_count - COALESCE(i2.tree_page_io_latch_wait_count, 0) < 0
  AND i1.tree_page_io_latch_wait_in_ms - COALESCE(i2.tree_page_io_latch_wait_in_ms, 0) < 0
  AND i1.page_compression_attempt_count - COALESCE(i2.page_compression_attempt_count, 0) < 0
  AND i1.page_compression_success_count - COALESCE(i2.page_compression_success_count, 0) < 0)
WHERE i1.HistoryID = 1
--Only include rows are greater than 0
AND ( i1.leaf_insert_count - COALESCE(i2.leaf_insert_count, 0) > 0
  OR i1.leaf_delete_count - COALESCE(i2.leaf_delete_count, 0) > 0
  OR i1.leaf_update_count - COALESCE(i2.leaf_update_count, 0) > 0
  OR i1.leaf_ghost_count - COALESCE(i2.leaf_ghost_count, 0) > 0
  OR i1.nonleaf_insert_count - COALESCE(i2.nonleaf_insert_count, 0) > 0
  OR i1.nonleaf_delete_count - COALESCE(i2.nonleaf_delete_count, 0) > 0
  OR i1.nonleaf_update_count - COALESCE(i2.nonleaf_update_count, 0) > 0
  OR i1.leaf_allocation_count - COALESCE(i2.leaf_allocation_count, 0) > 0
  OR i1.nonleaf_allocation_count - COALESCE(i2.nonleaf_allocation_count, 0) > 0
  OR i1.leaf_page_merge_count - COALESCE(i2.leaf_page_merge_count, 0) > 0
  OR i1.nonleaf_page_merge_count - COALESCE(i2.nonleaf_page_merge_count, 0) > 0
  OR i1.range_scan_count - COALESCE(i2.range_scan_count, 0) > 0
  OR i1.singleton_lookup_count - COALESCE(i2.singleton_lookup_count, 0) > 0
  OR i1.forwarded_fetch_count - COALESCE(i2.forwarded_fetch_count, 0) > 0
  OR i1.lob_fetch_in_pages - COALESCE(i2.lob_fetch_in_pages, 0) > 0
  OR i1.lob_fetch_in_bytes - COALESCE(i2.lob_fetch_in_bytes, 0) > 0
  OR i1.lob_orphan_create_count - COALESCE(i2.lob_orphan_create_count, 0) > 0
  OR i1.lob_orphan_insert_count - COALESCE(i2.lob_orphan_insert_count, 0) > 0
  OR i1.row_over?ow_fetch_in_pages - COALESCE(i2.row_over?ow_fetch_in_pages, 0) > 0
  OR i1.row_over?ow_fetch_in_bytes - COALESCE(i2.row_over?ow_fetch_in_bytes, 0) > 0
  OR i1.column_value_push_off_row_count - COALESCE(i2.column_value_push_off_row_count, 0) > 0
  OR i1.column_value_pull_in_row_count - COALESCE(i2.column_value_pull_in_row_count, 0) > 0
  OR i1.row_lock_count - COALESCE(i2.row_lock_count, 0) > 0
  OR i1.row_lock_wait_count - COALESCE(i2.row_lock_wait_count, 0) > 0
  OR i1.row_lock_wait_in_ms - COALESCE(i2.row_lock_wait_in_ms, 0) > 0
  OR i1.page_lock_count - COALESCE(i2.page_lock_count, 0) > 0
  OR i1.page_lock_wait_count - COALESCE(i2.page_lock_wait_count, 0) > 0
  OR i1.page_lock_wait_in_ms - COALESCE(i2.page_lock_wait_in_ms, 0) > 0
  OR i1.index_lock_promotion_attempt_count - COALESCE(i2.index_lock_promotion_attempt_count, 0) > 0
  OR i1.index_lock_promotion_count - COALESCE(i2.index_lock_promotion_count, 0) > 0
  OR i1.page_latch_wait_count - COALESCE(i2.page_latch_wait_count, 0) > 0
  OR i1.page_latch_wait_in_ms - COALESCE(i2.page_latch_wait_in_ms, 0) > 0
  OR i1.page_io_latch_wait_count - COALESCE(i2.page_io_latch_wait_count, 0) > 0
  OR i1.page_io_latch_wait_in_ms - COALESCE(i2.page_io_latch_wait_in_ms, 0) > 0
  OR i1.tree_page_latch_wait_count - COALESCE(i2.tree_page_latch_wait_count, 0) > 0
  OR i1.tree_page_latch_wait_in_ms - COALESCE(i2.tree_page_latch_wait_in_ms, 0) > 0
  OR i1.tree_page_io_latch_wait_count - COALESCE(i2.tree_page_io_latch_wait_count, 0) > 0
  OR i1.tree_page_io_latch_wait_in_ms - COALESCE(i2.tree_page_io_latch_wait_in_ms, 0) > 0
  OR i1.page_compression_attempt_count - COALESCE(i2.page_compression_attempt_count, 0) > 0
  OR i1.page_compression_success_count - COALESCE(i2.page_compression_success_count, 0) > 0)
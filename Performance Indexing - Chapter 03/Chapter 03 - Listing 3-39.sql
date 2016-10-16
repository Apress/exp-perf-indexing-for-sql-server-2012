--Listing 3-39.  Parameters for sys.dm_db_index_physical_stats
sys.dm_db_index_physical_stats (
  { database_id | NULL | 0 | DEFAULT }
  , { object_id | NULL | 0 | DEFAULT }
  , { index_id | NULL | 0 | -1 | DEFAULT }
  , { partition_number | NULL | 0 | DEFAULT }
  , { mode | NULL | DEFAULT }
)
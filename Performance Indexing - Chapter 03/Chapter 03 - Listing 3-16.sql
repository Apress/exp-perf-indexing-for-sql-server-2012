--Listing 3-16.  Index Operational Stats Syntax
sys.dm_db_index_operational_stats (
    { database_id | NULL | 0 | DEFAULT }
    , { object_id | NULL | 0 | DEFAULT }
    , { index_id | 0 | NULL | -1 | DEFAULT }
    , { partition_number | NULL | 0 | DEFAULT }
)
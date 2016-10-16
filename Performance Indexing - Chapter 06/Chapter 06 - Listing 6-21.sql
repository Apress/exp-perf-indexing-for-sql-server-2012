--Listing 6-21.  Index Reorganization with ALTER INDEX
ALTER INDEX { index_name | ALL }
    ON <object>
    | REORGANIZE
      [ PARTITION = partition_number ]
      [ WITH ( LOB_COMPACTION = { ON | OFF } ) ]
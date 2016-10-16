--Listing 1-3.  ALTER INDEX Syntax
ALTER INDEX { index_name | ALL }
  ON <object>
  { REBUILD
    [ [PARTITION = ALL]
     [ WITH ( <rebuild_index_option> [ ,…n ] ) ]
     | [ PARTITION = partition_number
        [ WITH ( <single_partition_rebuild_index_option>
            [ ,…n ] )
        ]
      ]
    ]
  | DISABLE
  | REORGANIZE
    [ PARTITION = partition_number ]
    [ WITH ( LOB_COMPACTION = { ON | OFF } ) ]
 | SET ( <set_index_option> [ ,…n ] )
  }
[ ; ]
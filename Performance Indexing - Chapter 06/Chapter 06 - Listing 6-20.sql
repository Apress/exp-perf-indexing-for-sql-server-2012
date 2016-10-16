--Listing 6-20.  Index Rebuild with ALTER INDEX
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
--Listing 1-5.  DROP INDEX Options
MAXDOP = max_degree_of_parallelism
  | ONLINE = { ON | OFF }
 | MOVE TO { partition_scheme_name ( column_name )
      | ?legroup_name
      | "default"
      }
 [ FILESTREAM_ON { partition_scheme_name
      | ?lestream_?legroup_name
      | "default" } ]
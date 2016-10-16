--Listing 6-19.  Index Rebuild with CREATE INDEX
CREATE [ UNIQUE ] [ CLUSTERED | NONCLUSTERED ] INDEX index_name
    ON <object> ( column [ ASC | DESC ] [ ,…n ] )
    [ INCLUDE ( column_name [ ,…n ] ) ]
    [ WHERE <?lter_predicate> ]
    [ WITH ( <relational_index_option> [ ,…n ] ) ]
    [ ON { partition_scheme_name ( column_name )
       | ?legroup_name
       | default
       }
    ]
    [ FILESTREAM_ON { ?lestream_?legroup_name | partition_scheme_name | “NULL” } ]
[ ; ]
<relational_index_option> ::=
  DROP_EXISTING = { ON | OFF }
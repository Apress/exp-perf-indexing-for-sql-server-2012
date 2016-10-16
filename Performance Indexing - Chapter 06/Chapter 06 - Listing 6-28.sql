--Listing 6-28.  UPDATE STATISTICS Syntax
UPDATE STATISTICS table_or_indexed_view_name
    [
      {
         { index_or_statistics_name }
       | ( { index_or_statistics_name } [ ,…n ] )
             }
    ]
  [  WITH
    [
      [ FULLSCAN ]
      | SAMPLE number { PERCENT | ROWS } ]
      | RESAMPLE
    ]
    [ [ , ] [ ALL | COLUMNS | INDEX ]
    [ [ , ] NORECOMPUTE ]
  ] ;
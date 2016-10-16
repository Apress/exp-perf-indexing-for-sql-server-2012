--Listing 4-14.  CREATE FULL TEXT INDEX Statement
CREATE FULLTEXT INDEX ON dbo.
SQLServerDocuments
    (
    DOC
    TYPE COLUMN DocType
    )
  KEY INDEX [PK__SQLServe__3214EC2769F9A9EA]
  ON WhitePaperCatalog
  WITH STOPLIST = WhitePaperStopList;
GO
--Listing 4-10.  Table and INSERT Statements Used with Full-Text Search
CREATE TABLE SQLServerDocuments (ID INT IDENTITY(1,1) PRIMARY KEY, DocType VARCHAR(6), DOC 
VARBINARY(MAX))
GO
DECLARE @worddoc VARBINARY(MAX)
SELECT @worddoc = CAST(bulkcolumn AS VARBINARY(MAX))
FROM OPENROWSET( BULK 'C:\High Availability with SQL Server 2008.doc', SINGLE_BLOB ) AS x

INSERT INTO SQLServerDocuments (DocType,DOC)
VALUES ('doc',@worddoc)
GO
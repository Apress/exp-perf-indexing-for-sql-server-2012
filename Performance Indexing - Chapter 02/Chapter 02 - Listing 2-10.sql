--Listing 2-10.  DBCC IND Query for DBCC PAGE Examples
USE [Chapter2Internals];
GO
CREATE TABLE dbo.IndexInternalsFour
    (
    RowID int IDENTITY(1,1) NOT NULL
    ,FillerData varchar(2000) NULL
    ,CONSTRAINT PK_IndexInternalsFour PRIMARY KEY CLUSTERED ([RowID] ASC)
    );
INSERT INTO dbo.IndexInternalsFour (FillerData)
VALUES (REPLICATE(1,2000)),(REPLICATE(2,2000)),(REPLICATE(3,2000))
   ,(REPLICATE(4,2000)),(REPLICATE(5,25));
GO
DBCC IND(0, 'dbo.IndexInternalsFour', -1);
GOO
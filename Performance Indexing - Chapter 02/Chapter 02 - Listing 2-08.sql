--Listing 2-8.  DBCC IND Example Two
USE Chapter2Internals
GO
CREATE TABLE dbo.IndexInternalsThree
    (
    RowID INT IDENTITY(1,1)
    ,FillerData CHAR(8000)
    ,CONSTRAINT PK_IndexInternalsThree PRIMARY KEY CLUSTERED (RowID)
    )
GO
INSERT INTO dbo.IndexInternalsThree DEFAULT VALUES
GO 4
DBCC IND (0, 'IndexInternalsThree',-1)
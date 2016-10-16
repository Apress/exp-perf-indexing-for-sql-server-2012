--Listing 2-2.  DBCC EXTENTINFO Example One
USE master
GO
CREATE DATABASE Chapter2Internals
GO
USE Chapter2Internals
GO
CREATE TABLE dbo.IndexInternalsOne
    (
    RowID INT IDENTITY(1,1)
    ,FillerData CHAR(8000)
    )
GO
INSERT INTO dbo.IndexInternalsOne DEFAULT VALUES
GO 4
DBCC EXTENTINFO(0, IndexInternalsOne, -1)
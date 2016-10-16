--Listing 2-5.  DBCC EXTENTINFO Example Four
CREATE TABLE dbo.IndexInternalsTwo
    (
    RowID INT IDENTITY(1,1)
    ,FillerData CHAR(8000)
    )
GO
INSERT INTO dbo.IndexInternalsTwo
VALUES ('Demo'),('Demo'),('Demo'),('Demo'),('Demo')
   ,('Demo'),('Demo'),('Demo'),('Demo');
GO
DBCC EXTENTINFO(0, IndexInternalsTwo, -1)
GOO
--Listing 6-11.  Creating a Table for DELETE Operation
IF OBJECT_ID('dbo.DeleteOperations') IS NOT NULL
    DROP TABLE dbo.DeleteOperations;
CREATE TABLE dbo.DeleteOperations
(
RowID int IDENTITY(1,1)
,Name sysname
,JunkValue varchar(2000)
);
INSERT INTO dbo.DeleteOperations (Name, JunkValue)
SELECT name, REPLICATE('X', 1000)
FROM sys.columns
CREATE CLUSTERED INDEX CLUS_UsingUniqueidenti?er ON dbo.DeleteOperations(RowID);
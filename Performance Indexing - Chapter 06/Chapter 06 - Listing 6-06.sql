--Listing 6-6.  CreateTable for UPDATE Operations
IF OBJECT_ID('dbo.UpdateOperations') IS NOT NULL
    DROP TABLE dbo.UpdateOperations;
CREATE TABLE dbo.UpdateOperations
(
RowID int IDENTITY(1,1)
,Name sysname
,JunkValue varchar(2000)
);
INSERT INTO dbo.UpdateOperations (Name, JunkValue)
SELECT name, REPLICATE('X', 1000)
FROM sys.columns
CREATE CLUSTERED INDEX CLUS_UsingUniqueidenti?er ON dbo.UpdateOperations(RowID);
--Listing 6-1.  Populate Uniqueidenti?er Table
IF OBJECT_ID('dbo.UsingUniqueidenti?er') IS NOT NULL
    DROP TABLE dbo.UsingUniqueidenti?er;
CREATE TABLE dbo.UsingUniqueidenti?er
(
RowID uniqueidenti?er CONSTRAINT DF_GUIDValue DEFAULT NEWID()
,Name sysname
,JunkValue varchar(2000)
);
INSERT INTO dbo.UsingUniqueidenti?er (Name, JunkValue)
SELECT name, REPLICATE('X', 2000)
FROM sys.columns
CREATE CLUSTERED INDEX CLUS_UsingUniqueidenti?er ON dbo.UsingUniqueidenti?er(RowID);
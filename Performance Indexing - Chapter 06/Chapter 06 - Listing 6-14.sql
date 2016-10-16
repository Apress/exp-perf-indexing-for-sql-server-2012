--Listing 6-14.  Shrink Operation Database Preparation
USE master
GO
DROP DATABASE Fragmentation
GO
CREATE DATABASE Fragmentation
GO
Use Fragmentation
GO
IF OBJECT_ID('dbo.FirstTable') IS NOT NULL
    DROP TABLE dbo.FirstTable;
CREATE TABLE dbo.FirstTable
(
RowID int IDENTITY(1,1)
,Name sysname
,JunkValue varchar(2000)
,CONSTRAINT PK_FirstTable PRIMARY KEY CLUSTERED (RowID)
);
INSERT INTO dbo.FirstTable (Name, JunkValue)
SELECT name, REPLICATE('X', 2000)
FROM sys.columns
IF OBJECT_ID('dbo.SecondTable') IS NOT NULL
    DROP TABLE dbo.SecondTable;
CREATE TABLE dbo.SecondTable
(
RowID int IDENTITY(1,1)
,Name sysname
,JunkValue varchar(2000)
,CONSTRAINT PK_SecondTable PRIMARY KEY CLUSTERED (RowID)
);
INSERT INTO dbo.SecondTable (Name, JunkValue)
SELECT name, REPLICATE('X', 2000)
FROM sys.columns
GO
INSERT INTO dbo.FirstTable (Name, JunkValue)
SELECT name, REPLICATE('X', 2000)
FROM sys.columns
GO
INSERT INTO dbo.SecondTable (Name, JunkValue)
SELECT name, REPLICATE('X', 2000)
FROM sys.columns
GO
INSERT INTO dbo.FirstTable (Name, JunkValue)
SELECT name, REPLICATE('X', 2000)
FROM sys.columns
GO
IF OBJECT_ID('dbo.SecondTable') IS NOT NULL
    DROP TABLE dbo.SecondTable;
GO
--Listing 8-12.  Script for GUID Pattern Scenario
USE AdventureWorks2012
GO
CREATE TABLE dbo.IndexStrategiesGUID_ICP (
RowID int IDENTITY(1,1)
,FillerData varchar(1000)
,CONSTRAINT PK_IndexStrategiesGUID_ICP PRIMARY KEY CLUSTERED (RowID)
);
CREATE TABLE dbo.IndexStrategiesGUID_UniqueID (
RowID uniqueidenti?er DEFAULT(NEWSEQUENTIALID())
,FillerData varchar(1000)
,CONSTRAINT PK_IndexStrategiesGUID_UniqueID PRIMARY KEY CLUSTERED (RowID)
);
CREATE TABLE dbo.IndexStrategiesGUID_String (
RowID varchar(36) DEFAULT(NEWID())
,FillerData varchar(1000)
,CONSTRAINT PK_IndexStrategiesGUID_String PRIMARY KEY CLUSTERED (RowID)
);
INSERT INTO dbo.IndexStrategiesGUID_ICP (FillerData)
SELECT TOP (250000) a1.name+a2.name
FROM sys.all_objects a1 CROSS JOIN sys.all_objects a2
INSERT INTO dbo.IndexStrategiesGUID_UniqueID (FillerData)
SELECT TOP (250000) a1.name+a2.NAME
FROM sys.all_objects a1 CROSS JOIN sys.all_objects a2
INSERT INTO dbo.IndexStrategiesGUID_String (FillerData)
SELECT TOP (250000) a1.name+a2.name
FROM sys.all_objects a1 CROSS JOIN sys.all_objects a2
SELECT OBJECT_NAME(object_ID) as table_name, in_row_used_page_count, in_row_reserved_page_count
FROM sys.dm_db_partition_stats
WHERE object_id IN (OBJECT_ID('dbo.IndexStrategiesGUID_ICP')
      ,OBJECT_ID('dbo.IndexStrategiesGUID_UniqueID')
      ,OBJECT_ID('dbo.IndexStrategiesGUID_String'))
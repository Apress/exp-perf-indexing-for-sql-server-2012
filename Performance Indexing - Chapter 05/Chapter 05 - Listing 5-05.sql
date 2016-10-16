--Listing 5-5.  Two Ways to Create PRIMARY KEYS
CREATE TABLE dbo.MythTwo1
  (
  RowID int NOT NULL
  ,Column1 nvarchar(128)
  ,Column2 nvarchar(128)
  )
ALTER TABLE dbo.MythTwo1
ADD CONSTRAINT PK_MythTwo1 PRIMARY KEY (RowID)
GO
CREATE TABLE dbo.MythTwo2
  (
  RowID int NOT NULL
  ,Column1 nvarchar(128)
  ,Column2 nvarchar(128)
  )
CREATE CLUSTERED INDEX CL_MythTwo2 ON dbo.MythTwo2 (RowID)
ALTER TABLE dbo.MythTwo2
ADD CONSTRAINT PK_MythTwo2 PRIMARY KEY (RowID)
GO
SELECT OBJECT_NAME(object_id) AS table_name
  ,name
  ,index_id
  ,type
  ,type_desc
  ,is_unique
  ,is_primary_key
FROM sys.indexes
WHERE object_id IN (OBJECT_ID('dbo.MythTwo1'),OBJECT_ID('dbo.MythTwo2'))
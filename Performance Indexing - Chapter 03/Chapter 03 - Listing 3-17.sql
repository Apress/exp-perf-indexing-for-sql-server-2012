--Listing 3-17.  DML Activity Script
USE AdventureWorks
GO
IF OBJECT_ID('dbo.KungFu') IS NOT NULL
  DROP TABLE dbo.KungFu
GO
CREATE TABLE dbo.KungFu
(
 KungFuID INT
,Hustle BIT
,CONSTRAINT PK_KungFu_KungFuID PRIMARY KEY CLUSTERED (KungFuID)
)
GO
INSERT INTO dbo.KungFu
   SELECT ROW_NUMBER() OVER (ORDER BY t.object_id)
       ,t.object_id % 2
   FROM sys.tables t
GO
DELETE FROM dbo.KungFu
WHERE  Hustle = 0
GO
UPDATE dbo.KungFu
SET    Hustle = 0
WHERE  Hustle = 1
GO
SELECT OBJECT_SCHEMA_NAME(ios.object_id) + '.' + OBJECT_NAME(ios.object_id) AS table_name
    ,i.name AS index_name
    ,ios.leaf_insert_count
    ,ios.leaf_update_count
    ,ios.leaf_delete_count
    ,ios.leaf_ghost_count
FROM sys.dm_db_index_operational_stats(DB_ID(),NULL,NULL,NULL) ios
     INNER JOIN sys.indexes i
       ON i.object_id = ios.object_id
         AND i.index_id = ios.index_id
WHERE ios.object_id = OBJECT_ID('dbo.KungFu')
ORDER BY ios.range_scan_count DESC
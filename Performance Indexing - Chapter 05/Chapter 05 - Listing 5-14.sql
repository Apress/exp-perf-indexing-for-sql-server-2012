--Listing 5-14.  Create and Populate Myth Six Table
CREATE TABLE dbo.MythSix
  (
  RowID int NOT NULL
  ,Column1 varchar(500)
  );
ALTER TABLE dbo.MythSix ADD CONSTRAINT
    PK_MythSix PRIMARY KEY CLUSTERED (RowID) WITH(FILLFACTOR = 50)
WITH L1(z) AS (SELECT 0 UNION ALL SELECT 0)
, L2(z) AS (SELECT 0 FROM L1 a CROSS JOIN L1 b)
, L3(z) AS (SELECT 0 FROM L2 a CROSS JOIN L2 b)
, L4(z) AS (SELECT 0 FROM L3 a CROSS JOIN L3 b)
, L5(z) AS (SELECT 0 FROM L4 a CROSS JOIN L4 b)
, L6(z) AS (SELECT TOP 1000 0 FROM L5 a CROSS JOIN L5 b)
INSERT INTO dbo.MythSix

SELECT ROW_NUMBER() OVER (ORDER BY z) AS RowID, REPLICATE('X', 500)
FROM L6
SELECT object_id, index_id, avg_page_space_used_in_percent
FROM sys.dm_db_index_physical_stats(DB_ID(),OBJECT_ID('dbo.MythSix'),NULL,NULL,'DETAILED')
WHERE index_level = 0
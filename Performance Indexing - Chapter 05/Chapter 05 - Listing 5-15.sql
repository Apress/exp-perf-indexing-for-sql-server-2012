--Listing 5-15.  Rebuild Clustered Index on Myth Six Table
ALTER INDEX PK_MythSix ON dbo.MythSix REBUILD
SELECT object_id, index_id, avg_page_space_used_in_percent
FROM sys.dm_db_index_physical_stats(DB_ID(),OBJECT_ID('dbo.MythSix'),NULL,NULL,'DETAILED')
WHERE index_level = 0
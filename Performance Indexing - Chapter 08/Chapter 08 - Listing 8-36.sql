--Listing 8-36.  Implementing Page Compression
USE AdventureWorks2012
GO
CREATE CLUSTERED INDEX CLIX_PageCompression ON dbo.PageCompression
    (SalesOrderID, SalesOrderDetailID)
    WITH (DATA_COMPRESSION = PAGE);
SELECT OBJECT_NAME(object_id) AS table_name
    ,in_row_reserved_page_count
FROM sys.dm_db_partition_stats
WHERE object_id IN (OBJECT_ID('dbo.NoCompression'),OBJECT_ID('dbo.PageCompression'))
--Listing 8-33.  Implementing Row Compression
USE AdventureWorks2012
GO
CREATE CLUSTERED INDEX CLIX_NoCompression ON dbo.NoCompression
   (SalesOrderID, SalesOrderDetailID);
CREATE CLUSTERED INDEX CLIX_RowCompression ON dbo.RowCompression
   (SalesOrderID, SalesOrderDetailID)
  WITH (DATA_COMPRESSION = ROW);
SELECT OBJECT_NAME(object_id) AS table_name
    ,in_row_reserved_page_count
FROM sys.dm_db_partition_stats
WHERE object_id IN (OBJECT_ID('dbo.NoCompression'),OBJECT_ID('dbo.RowCompression'))
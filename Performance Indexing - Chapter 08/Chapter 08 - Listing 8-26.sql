--Listing 8-26.  Filtered Index Pattern
USE AdventureWorks2012
GO
CREATE INDEX IX_Contacts_Certi?cationDate ON dbo.Contacts(Certi?cationDate)
      INCLUDE (FirstName, LastName)
      WHERE Certi?cationDate IS NOT NULL;
SET STATISTICS IO ON
SELECT ContactID, FirstName, LastName, Certi?cationDate
FROM dbo.Contacts
WHERE Certi?cationDate IS NOT NULL
ORDER BY Certi?cationDate
SELECT ContactID, FirstName, LastName, Certi?cationDate
FROM dbo.Contacts
WHERE Certi?cationDate BETWEEN '20050101' AND '20050201'
ORDER BY Certi?cationDate
SET STATISTICS IO OFF
SELECT OBJECT_NAME(object_id) as table_name
      ,CASE index_id
      WHEN INDEXPROPERTY(object_id , 'IX_Contacts_Certi?cationDate', 'IndexID') THEN 'Filtered Index'
    WHEN 1 THEN 'Clustered Index'
    ELSE 'Other Indexes' END As index_type
    ,index_id
    ,in_row_data_page_count
    ,in_row_reserved_page_count
    ,in_row_used_page_count
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID('dbo.Contacts')
--Listing 10-48.  Buffer Allocation for Each Database
SELECT  LEFT(CASE database_id
        WHEN 32767 THEN 'ResourceDb'
        ELSE DB_NAME(database_id)
       END,20) AS Database_Name
    ,COUNT(*) AS Buffered_Page_Count
    ,CAST(COUNT(*) * 8 / 1024.0 AS NUMERIC(10,2)) AS Buffer_Pool_MB
FROM  sys.dm_os_buffer_descriptors
GROUP BY DB_NAME(database_id)
    ,database_id
ORDER BY Buffered_Page_Count DESC
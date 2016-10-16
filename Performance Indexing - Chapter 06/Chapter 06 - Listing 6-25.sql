--Listing 6-25.  Script to Build Index Defragmentation Statements
SELECT @SQL='ALTER INDEX '
+@IndexName+' ON '+@ObjectName
+CASE WHEN @CurrentFragmentation <= 30
THEN ' REORGANIZE;'
ELSE ' REBUILD'
+CASE WHEN CONVERT(VARCHAR(100), SERVERPROPERTY('Edition')) LIKE 'Data Center%'
OR CONVERT(VARCHAR(100), SERVERPROPERTY('Edition')) LIKE 'Enterprise%'
OR CONVERT(VARCHAR(100), SERVERPROPERTY('Edition')) LIKE 'Developer%'
THEN ' WITH (ONLINE=ON, SORT_IN_TEMPDB=ON) '
END+';'
END
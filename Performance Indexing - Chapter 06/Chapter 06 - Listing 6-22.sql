--Listing 6-22.  Index Defragmantion Script Template
DECLARE @MaxFragmentation TINYINT=30
,@MinimumPages SMALLINT=1000
,@SQL nvarchar(max)
,@ObjectName NVARCHAR(300)
,@IndexName NVARCHAR(300)
,@CurrentFragmentation DECIMAL(9, 6)
DECLARE @FragmentationState TABLE
(
SchemaName SYSNAME
,TableName SYSNAME
,object_id INT
,IndexName SYSNAME
,index_id INT
,page_count BIGINT
,avg_fragmentation_in_percent FLOAT
,avg_page_space_used_in_percent FLOAT
,type_desc VARCHAR(255)
)
INSERT INTO @FragmentationState
<Script to Collect Fragmenation Data (Listing 6-23)>
DECLARE INDEX_CURSE CURSOR LOCAL FAST_FORWARD FOR
<Script to Identify Fragmented Indexes (Listing 6-24)>
OPEN INDEX_CURSE
WHILE 1=1
BEGIN
  FETCH NEXT FROM INDEX_CURSE INTO @ObjectName, @IndexName
    ,@CurrentFragmentation
  IF @@FETCH_STATUS <> 0
      BREAK
  <Script to Build Index Defragmentation Statements (Listing 6-25)>
  EXEC sp_ExecuteSQL @SQL
 END
CLOSE INDEX_CURSE
DEALLOCATE INDEX_CURSE
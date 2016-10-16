--Listing 10-19.  Add Filters to SQL Trace Session
USE master
GO
DECLARE @int?lter INT = 5
  ,@FileName NVARCHAR(256) = 'c:\temp\IndexingMethod'
  ,@TraceID INT
SET @TraceID = (SELECT id FROM sys.traces WHERE path LIKE @FileName+'%')
--Remove system databases from output
EXEC sp_trace_set?lter @TraceID, 3, 0, 4, @int?lter
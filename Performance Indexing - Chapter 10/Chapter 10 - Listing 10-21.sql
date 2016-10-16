--Listing 10-21.  Stop SQL Trace Session
USE master
GO
DECLARE @FileName NVARCHAR(256) = 'c:\temp\IndexingMethod'
  ,@TraceID INT
SET @TraceID = (SELECT id FROM sys.traces WHERE path LIKE @FileName+'%')
-- Set the trace status to stop
exec sp_trace_setstatus @TraceID, 0
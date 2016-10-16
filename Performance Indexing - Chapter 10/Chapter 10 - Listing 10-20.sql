--Listing 10-20.  Start SQL Trace Session
USE master
GO
DECLARE @FileName NVARCHAR(256) = 'c:\temp\IndexingMethod'
  ,@TraceID INT
SET @TraceID = (SELECT id FROM sys.traces WHERE path LIKE @FileName+'%')
-- Set the trace status to start
exec sp_trace_setstatus @TraceID, 1
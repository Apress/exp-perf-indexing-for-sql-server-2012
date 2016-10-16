--Listing 10-17.  Create SQL Trace Session
USE master
GO
-- Create a Queue
DECLARE @rc INT
  ,@TraceID int
  ,@max?lesize BIGINT = 50 --Maximum .trc ?le size in MB
  ,@FileName NVARCHAR(256) = 'c:\temp\IndexingMethod' --File name and path, minus the extension
EXEC @rc = sp_trace_create @TraceID output, 0, @FileName, @max?lesize, NULL
if (@rc != 0) RAISERROR('Error creating trace ?le',16,1)
SELECT * FROM sys.traces WHERE id = @TraceID
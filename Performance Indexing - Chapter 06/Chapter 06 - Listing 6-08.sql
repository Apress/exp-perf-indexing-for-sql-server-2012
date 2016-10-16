--Listing 6-8.  Create Non-clustered Index for UPDATE operations
CREATE NONCLUSTERED INDEX IX_Name ON dbo.UpdateOperations(Name) INCLUDE (JunkValue);
--Listing 6-7.  Create Table for UPDATE Operations
UPDATE dbo.UpdateOperations
SET JunkValue = REPLICATE('X', 2000)
WHERE RowID % 5 = 1
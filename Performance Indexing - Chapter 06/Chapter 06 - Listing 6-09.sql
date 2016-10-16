--Listing 6-9.  UPDATE Operation to Change Index Key Value
UPDATE dbo.UpdateOperations
SET Name = REVERSE(Name)
WHERE RowID % 9 = 1
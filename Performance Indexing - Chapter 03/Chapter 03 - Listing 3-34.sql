--Listing 3-34.  T-SQL Script to Increase Page Allocations
USE AdventureWorks2012 ;
GO
UPDATE dbo.AllocationCycle
SET    FillerData = REPLICATE('x',1000)
WHERE  ID % 3 = 1 ;
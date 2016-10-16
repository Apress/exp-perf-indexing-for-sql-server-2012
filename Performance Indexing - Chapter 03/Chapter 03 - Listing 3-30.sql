--Listing 3-30.  T-SQL Script to Generate Page Latch Load
INSERT INTO dbo.PageLatchDemo
 (FillerData)
SELECT t.object_id % 2
FROM sys.tables t
--Listing 10-23.  Forwarded Records Example
USE [IndexingMethod]
GO
CREATE TABLE dbo.HeapExample
  (ID INT IDENTITY
  ,FillerData VARCHAR(2000)
  )
INSERT INTO dbo.HeapExample (FillerData)
SELECT REPLICATE('X',100)
FROM sys.all_objects
UPDATE dbo.HeapExample
SET FillerData = REPLICATE('X',2000)
WHERE ID % 5 = 1
GO
SELECT *
FROM dbo.HeapExample
WHERE ID % 3 = 1
GO 2
--Listing 3-37.  T-SQL Script to Generate LOB Scenario
IF OBJECT_ID('dbo.LOBAccess') IS NOT NULL
    DROP TABLE dbo.LOBAccess
GO
CREATE TABLE dbo.LOBAccess
  (
  ID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED
  ,LOBValue VARCHAR(MAX)
  ,FillerData CHAR(2000) DEFAULT(REPLICATE('X',2000))
  ,FillerDate DATETIME DEFAULT(GETDATE())
  )
INSERT INTO dbo.LOBAccess (LOBValue)
SELECT TOP 10 'Short Value'
FROM Production.ProductPhoto
UPDATE dbo.LOBAccess
SET LOBValue = REPLICATE('Long Value',8000)
SELECT * FROM dbo.LOBAccess
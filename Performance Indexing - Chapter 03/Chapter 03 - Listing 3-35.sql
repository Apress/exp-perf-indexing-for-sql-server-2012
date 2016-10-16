--Listing 3-35.  T-SQL Script to Generate Page Latch Scenario
USE AdventureWorks2012
GO
IF OBJECT_ID('dbo.PageCompression') IS NOT NULL
    DROP TABLE dbo.PageCompression
GO
CREATE TABLE dbo.PageCompression(
       ProductPhotoID int NOT NULL,
       ThumbNailPhoto varbinary(max) NULL,
       LargePhoto varbinary(max) NULL,
  CONSTRAINT PK_PageCompression PRIMARY KEY CLUSTERED (ProductPhotoID))
  WITH (DATA_COMPRESSION = PAGE);
INSERT INTO dbo.PageCompression
SELECT ProductPhotoID
  ,ThumbNailPhoto
  ,LargePhoto
FROM Production.ProductPhoto
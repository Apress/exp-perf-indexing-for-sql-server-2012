--Listing 3-29.  T-SQL Script to Generate Page Latch Scenario
USE AdventureWorks2012
GO
IF OBJECT_ID('dbo.PageLatchDemo') IS NOT NULL
    DROP TABLE dbo.PageLatchDemo
GO
CREATE TABLE dbo.PageLatchDemo
(
PageLatchDemoID INT IDENTITY (1,1)
,FillerData bit
,CONSTRAINT PK_PageLatchDemo_PageLatchDemoID PRIMARY KEY CLUSTERED (PageLatchDemoID)
)
GO
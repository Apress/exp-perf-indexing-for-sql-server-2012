--Listing 5-12.  Create and Populate Myth Five Table
CREATE TABLE dbo.MythFive
(
RowID int PRIMARY KEY CLUSTERED
,TestValue varchar(20) NOT NULL
);
INSERT INTO dbo.MythFive (RowID, TestValue) VALUES (1, 'FirstRecordAdded');
INSERT INTO dbo.MythFive (RowID, TestValue) VALUES (3, 'SecondRecordAdded');
INSERT INTO dbo.MythFive (RowID, TestValue) VALUES (2, 'ThirdRecordAdded');
GO
DBCC IND ('AdventureWorks2008R2', 'dbo.MythFive', 1);
GO
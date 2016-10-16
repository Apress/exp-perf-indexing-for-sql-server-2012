--Listing 8-4.  Creating and Populating Table for Identity Column Pattern
USE AdventureWorks2012
GO
CREATE TABLE dbo.IndexStrategiesFruit
(
FruitID int IDENTITY(1,1)
,FruitName varchar(25)
,Color varchar(10)
,CONSTRAINT PK_Fruit_FruitID PRIMARY KEY CLUSTERED (FruitID)
);
INSERT INTO dbo.IndexStrategiesFruit(FruitName, Color)
VALUES('Apple','Red'),('Banana','Yellow'),('Apple','Green'),('Grape','Green');
SELECT FruitID, FruitName, Color
FROM dbo.IndexStrategiesFruit;
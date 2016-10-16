--Listing 8-5.  Creating and Populating Table for Surrogate Key Pattern
USE AdventureWorks2012
GO
CREATE TABLE dbo.IndexStrategiesSurrogate
(
StateAbbreviation char(2)
,StateName varchar(25)
,Country varchar(25)
,CONSTRAINT PK_State_StateAbbreviation PRIMARY KEY CLUSTERED (StateAbbreviation)
);
INSERT INTO dbo.IndexStrategiesSurrogate(StateAbbreviation, StateName, Country)
VALUES('MN','Minnesota','United States')
,('FL','Florida','United States')
,('WI','Wisconsin','United States')
,('NH','New Hampshire','United States');
SELECT StateAbbreviation, StateName, Country
FROM dbo.IndexStrategiesSurrogate;
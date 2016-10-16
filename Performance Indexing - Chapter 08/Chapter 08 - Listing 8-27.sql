--Listing 8-27.  Setup for Foreign Key Pattern
USE AdventureWorks2012
GO
CREATE TABLE dbo.Customer(
      CustomerID int
      ,FillterData char(1000)
      ,CONSTRAINT PK_Customer_CustomerID PRIMARY KEY CLUSTERED (CustomerID)
      );
CREATE TABLE dbo.SalesOrderHeader(
      SalesOrderID int
      ,OrderDate datetime
      ,DueDate datetime
      ,CustomerID int
      ,FillterData char(1000)
      ,CONSTRAINT PK_SalesOrderHeader_SalesOrderID PRIMARY KEY CLUSTERED (SalesOrderID)
      ,CONSTRAINT GK_SalesOrderHeader_CustomerID_FROM_Customer FOREIGN KEY (CustomerID) 
REFERENCES dbo.Customer(CustomerID)
      );
INSERT INTO dbo.Customer (CustomerID)
SELECT CustomerID
FROM Sales.Customer;
INSERT INTO dbo.SalesOrderHeader (SalesOrderID, OrderDate, DueDate, CustomerID)
SELECT SalesOrderID, OrderDate, DueDate, CustomerID
FROM Sales.SalesOrderHeader;
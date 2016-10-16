--Listing 7-5.  Database Engine Tuning Advisor Index Recommendations
USE [AdventureWorks2012];
GO
CREATE NONCLUSTERED INDEX [_dta_index_SalesOrderHeader_7_754101727__K4_3] ON [Sales].[SalesOrderHeader]
(
    [DueDate] ASC
)
INCLUDE ( [OrderDate]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY];
GO
CREATE NONCLUSTERED INDEX [_dta_index_SalesOrderHeader_7_754101727__K3_K4_11] ON [Sales].[SalesOrderHeader]
(
    [OrderDate] ASC,
    [DueDate] ASC
)
INCLUDE ( [CustomerID]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY];
GO
CREATE STATISTICS [_dta_stat_754101727_4_3] ON [Sales].[SalesOrderHeader]([DueDate], [OrderDate]);
GO
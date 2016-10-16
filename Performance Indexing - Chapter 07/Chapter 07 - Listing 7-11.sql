--Listing 7-11.  Second Scenario DTA Utility Output
use [AdventureWorks2012]
go
DROP INDEX [CL_SalesOrderDetail] ON [dbo].[SalesOrderDetail]
go
DROP INDEX [IX_SalesOrderDetail] ON [dbo].[SalesOrderDetail]
go
CREATE CLUSTERED INDEX [_dta_index_SalesOrderDetail_c_7_1348199853__K1] ON [dbo].[SalesOrderDetail]
(
    [SalesOrderID] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go
CREATE STATISTICS [_dta_stat_1348199853_1_2] ON [dbo].[SalesOrderDetail]([SalesOrderID], [SalesOrderDetailID])
go
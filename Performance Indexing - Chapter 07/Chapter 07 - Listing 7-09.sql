--Listing 7-9.  First Scenario DTA Utility Output
use [AdventureWorks2012]
go
SET ANSI_PADDING ON
go
CREATE NONCLUSTERED INDEX [_dta_index_SalesOrderDetail_18_1591676718__K1_K2_3] ON [dbo].[SalesOrderDetail]
(
    [SalesOrderID] ASC,
    [SalesOrderDetailID] ASC
)
INCLUDE (    [CarrierTrackingNumber]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go
CREATE NONCLUSTERED INDEX [_dta_index_SalesOrderDetail_18_1591676718__K1_K2_4] ON [dbo].[SalesOrderDetail]
(
    [SalesOrderID] ASC,
    [SalesOrderDetailID] ASC
)
INCLUDE ( [OrderQty]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go
CREATE STATISTICS [_dta_stat_1591676718_2_1] ON [dbo].[SalesOrderDetail]([SalesOrderDetailID], [SalesOrderID])
Go
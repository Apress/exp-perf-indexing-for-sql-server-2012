--Listing 10-46.  Extended Event Session for CXPACKET
IF EXISTS(SELECT * FROM sys.server_event_sessions WHERE name = 'ex_cxpacket')
    DROP EVENT SESSION ex_cxpacket ON SERVER
GO
CREATE EVENT SESSION [ex_cxpacket] ON SERVER
ADD EVENT sqlos.wait_info(
  ACTION(sqlserver.plan_handle,sqlserver.tsql_stack)
  WHERE ([wait_type]=(191) AND [sqlserver].[is_system]=(0))
  -- 191 in SQL Server 2012
  -- 187 in SQL Server 2008/R2
  )
ADD TARGET package0.histogram(
  SET ?ltering_event_name=N'sqlos.wait_info'
    ,slots=(2048)
    ,source=N'sqlserver.tsql_stack'
    ,source_type=(1))
WITH (STARTUP_STATE=ON)
GO
ALTER EVENT SESSION ex_cxpacket ON SERVER STATE = START
GO
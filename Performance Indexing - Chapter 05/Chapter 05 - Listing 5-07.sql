--Listing 5-7.  Extended Event Session for Lock Acquired and Released
CREATE EVENT SESSION [MythThree] ON SERVER
ADD EVENT sqlserver.lock_acquired(SET collect_database_name=(1)
  WHERE ([sqlserver].[session_id]=(66))),
ADD EVENT sqlserver.lock_released(
  WHERE ([sqlserver].[session_id]=(66)))
ADD TARGET package0.ring_buffer
GO
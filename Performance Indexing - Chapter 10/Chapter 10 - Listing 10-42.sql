--Listing 10-42.  System-Health Deadlock Query
USE IndexingMethod
GO
WITH deadlock
AS (
  SELECT CAST(target_data AS XML) AS target_data
  FROM sys.dm_xe_session_targets st
    INNER JOIN sys.dm_xe_sessions s ON s.address = st.event_session_address
  WHERE name = 'system_health'
  AND target_name = 'ring_buffer'
)
SELECT
  c.value('(@timestamp)[1]', 'datetime') AS event_timestamp
  ,c.query('data/value/deadlock')
FROM deadlock d
  CROSS APPLY target_data.nodes('//RingBufferTarget/event') AS t(c)
WHERE c.exist('.[@name = "xml_deadlock_report"]') = 1
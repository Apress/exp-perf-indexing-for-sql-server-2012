--Listing 10-1.  Performance Counter Snapshot Table
USE IndexingMethod
GO
CREATE TABLE dbo.IndexingCounters
  (
  counter_id INT IDENTITY(1, 1)
  ,create_date DATETIME
  ,server_name VARCHAR(128) NOT NULL
  ,object_name VARCHAR(128) NOT NULL
  ,counter_name VARCHAR(128) NOT NULL
  ,instance_name VARCHAR(128) NULL
  ,Calculated_Counter_value FLOAT NULL
  ,CONSTRAINT PK_IndexingCounters PRIMARY KEY CLUSTERED (counter_id)
  )
GO
CREATE NONCLUSTERED INDEX IX_IndexingCounters_CounterName
  ON dbo.IndexingCounters (counter_name)
  INCLUDE (create_date,server_name,object_name,Calculated_Counter_value)
--Listing 10-3.  Performance Counter Baseline Table
USE IndexingMethod
GO
CREATE TABLE dbo.IndexingCountersBaseline
  (
  counter_baseline_id INT IDENTITY(1, 1)
  ,start_date DATETIME
  ,end_date DATETIME
  ,server_name VARCHAR(128) NOT NULL
  ,object_name VARCHAR(128) NOT NULL
  ,counter_name VARCHAR(128) NOT NULL
  ,instance_name VARCHAR(128) NULL
  ,minimum_counter_value FLOAT NULL
  ,maximum_counter_value FLOAT NULL
  ,average_counter_value FLOAT NULL
  ,standard_deviation_counter_value FLOAT NULL
  ,CONSTRAINT PK_IndexingCountersBaseline
    PRIMARY KEY CLUSTERED (counter_baseline_id)
  )
GO  
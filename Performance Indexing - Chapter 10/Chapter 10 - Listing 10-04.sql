--Listing 10-4.  Populate Counter Baseline Table
USE IndexingMethod
GO
DECLARE @StartDate DATETIME = '20120301'
  ,@EndDate DATETIME = '20120325'
INSERT INTO dbo.IndexingCountersBaseline
    (
    start_date
    ,end_date
    ,server_name
    ,object_name
    ,counter_name
    ,instance_name
    ,minimum_counter_value
    ,maximum_counter_value
    ,average_counter_value
    ,standard_deviation_counter_value
    )
    SELECT MIN(create_date)
        ,MAX(create_date)
        ,server_name
        ,object_name
        ,counter_name
        ,instance_name
        ,MIN(calculated_Counter_value)
        ,MAX(calculated_Counter_value)
        ,AVG(calculated_Counter_value)
        ,STDEV(calculated_Counter_value)
    FROM  dbo.IndexingCounters
    WHERE create_date BETWEEN @StartDate AND @EndDate
    GROUP BY server_name
     ,object_name
     ,counter_name
     ,instance_name
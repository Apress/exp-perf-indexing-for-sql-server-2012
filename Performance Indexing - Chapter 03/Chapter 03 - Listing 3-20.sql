--Listing 3-20.  T-SQL Script for Forward Records
CREATE TABLE dbo.ForwardedRecords
    (
    ID INT IDENTITY(1,1)
    ,VALUE VARCHAR(8000)
    );
INSERT INTO dbo.ForwardedRecords (VALUE)
SELECT REPLICATE(type, 500)
FROM sys.objects;
UPDATE dbo.ForwardedRecords
SET VALUE = REPLICATE(VALUE, 16)
WHERE ID%3 = 1;
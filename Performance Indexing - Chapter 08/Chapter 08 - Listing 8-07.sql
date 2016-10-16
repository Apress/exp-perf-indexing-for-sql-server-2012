--Listing 8-7.  Single Header Row on Foreign Key Pattern
SELECT ish.HeaderID, ish.FillerData, isd.DetailID, isd.FillerData
FROM dbo.IndexStrategiesHeader ish
      INNER JOIN dbo.IndexStrategiesDetail_ICP isd ON ish.HeaderID = isd.HeaderID
WHERE ish.HeaderID = 10
SELECT ish.HeaderID, ish.FillerData, isd.DetailID, isd.FillerData
FROM dbo.IndexStrategiesHeader ish
    INNER JOIN dbo.IndexStrategiesDetail_FKP isd ON ish.HeaderID = isd.HeaderID
WHERE ish.HeaderID = 10
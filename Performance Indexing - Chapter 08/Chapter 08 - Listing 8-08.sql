--Listing 8-8.  Multiple Header Row on Foreign Key Pattern
SELECT ish.HeaderID, ish.FillerData, isd.DetailID, isd.FillerData
FROM dbo.IndexStrategiesHeader ish
      INNER JOIN dbo.IndexStrategiesDetail_ICP isd ON ish.HeaderID = isd.HeaderID
WHERE ish.HeaderID BETWEEN 10 AND 50
SELECT ish.HeaderID, ish.FillerData, isd.DetailID, isd.FillerData
FROM dbo.IndexStrategiesHeader ish
      INNER JOIN dbo.IndexStrategiesDetail_FKP isd ON ish.HeaderID = isd.HeaderID
WHERE ish.HeaderID BETWEEN 10 AND 50
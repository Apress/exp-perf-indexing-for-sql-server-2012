--Listing 4-8.  Query for the Top Ten Closest ZIP Codes to a Given Point
Declare @point geometry = geometry::STGeomFromText('POINT(-87.819473 42.55022)', 0)
SELECT TOP 10 geom FROM zt55_d00
WHERE geom.MakeValid().STDistance(@point) IS NOT NULL AND geom.MakeValid().STDistance(@point) < 1
ORDER BY geom.MakeValid().STDistance(@point);
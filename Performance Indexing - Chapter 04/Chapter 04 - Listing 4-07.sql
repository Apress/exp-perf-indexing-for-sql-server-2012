--Listing 4-7.  Using MakeValid() to Correct any Invalid Geometry Instances
UPDATE AREAZIP
SET GEOM = GEOM.MakeValid()
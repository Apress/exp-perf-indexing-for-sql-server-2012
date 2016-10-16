--Listing 2-7.  DBCC IND Example One
USE Chapter2Internals;
GO
DBCC IND (0, 'IndexInternalsOne',-1);
GO
DBCC IND (0, 'IndexInternalsTwo',-1);
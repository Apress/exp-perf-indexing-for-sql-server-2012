--Listing 6-4.  Create Non-Clustered Index
CREATE NONCLUSTERED INDEX IX_Name ON dbo.UsingUniqueidenti?er(Name) INCLUDE (JunkValue);
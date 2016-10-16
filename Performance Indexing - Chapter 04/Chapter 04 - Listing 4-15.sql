--Listing 4-15.  Using CONTAINS to Query for a Speci?c Word
SELECT
    DOC, DocType
FROM SQLServerDocuments
WHERE CONTAINS(DOC, 'replication')
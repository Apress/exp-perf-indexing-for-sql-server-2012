--Listing 4-17.  Utilizing sys.fulltext_index_catalog_usages
SELECT
    OBJECT_NAME(object_id) [Object Name],
    index_id,
    fulltext_catalog_id
FROM sys.fulltext_index_catalog_usages
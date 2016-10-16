--Listing 4-18.  Using all the Catalog Views for Full-Text Index Information
SELECT
    idx.is_enabled,
    idx.change_tracking_state,
    idx.crawl_type_desc,
    idx.crawl_end_date [Last Crawl],
    cat.[name],
    CASE WHEN cat.is_accent_sensitivity_on = 0 THEN 'Accent InSensitive'
         WHEN cat.is_accent_sensitivity_on = 1 THEN 'Accent Sensitive'
    END [Accent Sensitivity],
    lists.[name],
    lists.modify_date [Last Modi?ed Date of StopList]
FROM sys.fulltext_indexes idx
JOIN sys.fulltext_catalogs cat on idx.fulltext_catalog_id = cat.fulltext_catalog_id
JOIN sys.fulltext_stoplists lists on idx.stoplist_id = lists.stoplist_id
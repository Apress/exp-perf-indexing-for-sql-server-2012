--Listing 4-13.  Using sys.fulltext_stoplists to Review StopList Words
SELECT
    lists.stoplist_id,
    [name],
    stopword
FROM
sys.fulltext_stoplists lists
JOIN sys.fulltext_stopwords words on lists.stoplist_id = words.stoplist_id
WHERE words.[language] = 'English'
ORDER BY lists.[name]
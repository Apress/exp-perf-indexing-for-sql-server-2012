--Listing 4-12.  Create Full-Text Index Syntax
CREATE FULLTEXT INDEX ON <table name>
(<column name>)
KEY INDEX <index name [must be speci?ed]>
ON <catalog ?legroup>
WITH <index options>
CHANGE_TRACKING = <Manual | Auto | Off>
STOPLIST = <default system or specifed stoplist name>
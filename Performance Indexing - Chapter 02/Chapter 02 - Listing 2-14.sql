--Listing 2-14.  DBCC PAGE with Row Data Print Option
DBCC TRACEON(3604)
DBCC PAGE(0,1,296,3) -- Data page
DBCC PAGE(0,1,279,3) -- Index page
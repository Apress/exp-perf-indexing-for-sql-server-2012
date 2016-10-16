--Listing 6-26.  Index Defragmentation Statements
ALTER INDEX [PXML_Store_Demographics] ON [Sales].[Store] REBUILD WITH (ONLINE=OFF, SORT_IN_
TEMPDB=ON) ;
ALTER INDEX [IX_TransactionHistory_ProductID] ON [Production].[TransactionHistory] REBUILD 
WITH (ONLINE=ON, SORT_IN_TEMPDB=ON) ;
ALTER INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID] ON [Production].
[TransactionHistory] REBUILD WITH (ONLINE=ON, SORT_IN_TEMPDB=ON) ;
ALTER INDEX [PK_BillOfMaterials_BillOfMaterialsID] ON [Production].[BillOfMaterials] REBUILD 
WITH (ONLINE=ON, SORT_IN_TEMPDB=ON) ;
ALTER INDEX [IX_BillOfMaterials_UnitMeasureCode] ON [Production].[BillOfMaterials] REORGANIZE;
ALTER INDEX ALL ON [Production].[Product] REBUILD WITH (ONLINE=ON, SORT_IN_TEMPDB=ON) ;
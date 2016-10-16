--Listing 8-31.  ColumnStore Index
USE ContosoRetailDW
GO
CREATE COLUMNSTORE INDEX IX_FactSales_CStore ON dbo.FactSales (
   SalesKey, DateKey, channelKey, StoreKey, ProductKey, PromotionKey, CurrencyKey, UnitCost, UnitPrice,
   SalesQuantity, ReturnQuantity, ReturnAmount, DiscountQuantity, DiscountAmount, TotalCost, SalesAmount,
   ETLLoadID, LoadDate, UpdateDate)
GO
SET STATISTICS IO ON
SET STATISTICS TIME ON
SELECT dd.CalendarQuarter
      ,dpc.ProductCategoryName
      , COUNT(*) As TotalRows
      ,SUM(SalesQuantity) AS TotalSales
FROM dbo.FactSales fs
      INNER JOIN dbo.DimDate dd ON fs.DateKey = dd.Datekey
      INNER JOIN dbo.DimProduct dp ON fs.ProductKey = dp.ProductKey
      INNER JOIN dbo.DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.
ProductSubcategoryKey
    INNER JOIN dbo.DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
GROUP BY dd.CalendarQuarter
      ,dpc.ProductCategoryName
SET STATISTICS IO OFF
SET STATISTICS TIME OFF
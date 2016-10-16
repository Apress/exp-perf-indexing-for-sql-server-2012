--Listing 8-30.  ColumnStore Index
USE ContosoRetailDW
GO
SET STATISTICS IO ON
SET STATISTICS TIME ON
SELECT dd.CalendarQuarter
      ,dpc.ProductCategoryName
      ,COUNT(*) As TotalRows
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
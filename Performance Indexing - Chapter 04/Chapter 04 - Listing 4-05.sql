--Listing 4-5.  Querying XML Data with the exist() Method
SELECT
XMLValue.value('(/CheckoutItem/TotalSales/Product/ItemSale/NetPrice)[1]','varchar(max)')
 AS [Net Price],
XMLValue.value('(/CheckoutItem/TotalSales/Product/ItemSale/CouponPrice)[1]','varchar(max)')
  AS [Coupon Savings]
FROM XMLTable
WHERE
  XMLValue.exist('//TotalSales/Product/@ProdID[.="468"]') = 1
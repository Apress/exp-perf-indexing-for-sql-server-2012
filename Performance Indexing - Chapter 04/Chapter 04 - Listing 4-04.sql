--Listing 4-4.  Inserting XML into a SQL Server Table and XML Column
DECLARE @XML XML
SET @XML = '<CheckoutItem date="2/2/2010">
 <TotalSales>
  <Product ProdID="937" ProdName="Wonder bread">
   <ItemSale>
    <NetPrice>1.32</NetPrice>
    <CouponPrice>.97</CouponPrice>
   </ItemSale>
  </Product>
  <Product ProdID="468" ProdName="JIFF Peanut Butter">
   <ItemSale>
    <NetPrice>2.99</NetPrice>
    <CouponPrice>.40</CouponPrice>
   </ItemSale>
  </Product>
 </TotalSales>
</CheckoutItem>'
INSERT INTO XMLTable VALUES (@XML)
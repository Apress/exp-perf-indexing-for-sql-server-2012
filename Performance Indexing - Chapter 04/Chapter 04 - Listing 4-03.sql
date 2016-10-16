--Listing 4-3.  Creating a Table and Specifying a Schema Collection on XML Columns
CREATE TABLE [dbo].[XMLTable](
       [XMLValue] [xml](CONTENT [dbo].[CheckoutCouponSchema]) NULL,
       [TransID] [bigint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED
(
    [TransID] ASC
))
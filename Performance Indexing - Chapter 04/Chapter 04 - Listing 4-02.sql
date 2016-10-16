--Listing 4-2.  CREATE SCHEMA COLLECTION Used to Create Typed XML
CREATE XML SCHEMA COLLECTION CheckoutCouponSchema AS '
<schema xmlns="http://www.w3.org/2001/XMLSchema">
 <element name="CheckoutItem">
  <complexType>
   <sequence>
    <element name="TotalSales" minOccurs="0">
     <complexType>
      <sequence>
       <element name="Product" minOccurs="1" maxOccurs="unbounded">
        <complexType>
         <sequence>
      <element name="ItemSale" minOccurs="1" maxOccurs="unbounded">
      <complexType>
       <sequence>
        <element name="NetPrice" type="string" />
        <element name="CouponPrice" type="string" />
       </sequence>
      </complexType>
     </element>
     </sequence>
     <attribute name="ProdID" type="string" use="required" />
     <attribute name="ProdName" type="string" use="required" />
        </complexType>
       </element>
      </sequence>
     </complexType>
    </element>
   </sequence>
   <attribute name="date" type="string" use="required" />
  </complexType>
 </element>
</schema>'
GO
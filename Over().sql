SELECT
  S.companyname AS supplier, 
  S.country,  
  P.productid, 
  P.productname, 
  P.unitprice, 
  AVG(p.unitprice) OVER(PARTITION BY s.companyname)[Supplier Average], 
  AVG(p.unitprice) OVER(Partition by s.country)[Country Average],
  AVG(p.unitprice) OVER() [AVG]
FROM Production.Suppliers AS S
  LEFT OUTER JOIN Production.Products AS P ON S.supplierid = P.supplierid

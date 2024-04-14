SELECT
A.Name AS 'ProductName'
,A.ListPrice
,B.Name AS ProductSubcategory
,C.Name AS Productcategory
,AvgPriceByCategory = AVG(ListPrice) Over(Partition by C.Name)
,AvgPriceBySubCategory = AVG(ListPrice) Over(Partition by B.Name)
,AvgPriceByCategoryAndSubCategory = AVG(ListPrice) Over(Partition by C.name,B.Name)
,ProductVsCategoryDelta = ListPrice - AVG(ListPrice) Over(Partition by C.Name)
,PriceRank = ROW_NUMBER() OVER(ORDER BY A.ListPrice  DESC)
,CategoryPriceRank = ROW_NUMBER() OVER(Partition By C.Name ORDER BY A.ListPrice  DESC)
,Top5PriceInCagtegory =
CASE
WHEN ROW_NUMBER() OVER(Partition By C.Name ORDER BY A.ListPrice  DESC) BETWEEN 1 AND 5  THEN 'YES'
ELSE 'NO'
END



FROM
Production.ProductSubcategory B
Join Production.Product A
ON B.ProductSubcategoryID = A.ProductSubcategoryID
Join Production.ProductCategory C
ON
C.ProductCategoryID = B.ProductCategoryID
Order by 3

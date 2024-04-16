SELECT  A.[ProductID]
      ,ProducName = [Name]
 ,B.ListPrice
 ,B.ModifiedDate
 ,HighestPrice = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY A.ProductID ORDER BY B.ListPrice DESC)
 ,LowestCost = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY A.ProductID ORDER BY B.ListPrice ASC)
 ,PriceRange = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY A.ProductID ORDER BY B.ListPrice DESC) -
 FIRST_VALUE(B.ListPrice) OVER(PARTITION BY A.ProductID ORDER BY B.ListPrice ASC)
     
  FROM [AdventureWorks2019].[Production].[Product] A
  JOIN [Production].[ProductListPriceHistory] B
  ON A.ProductID = B.ProductID
  ORDER BY
  A.ProductID , B.ModifiedDate DESC

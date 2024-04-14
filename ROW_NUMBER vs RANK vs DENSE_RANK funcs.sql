SELECT  
[SalesOrderID]
      ,[SalesOrderDetailID]
      --,[CarrierTrackingNumber]
      --,[OrderQty]
      --,[ProductID]
      --,[SpecialOfferID]
      --,[UnitPrice]
      --,[UnitPriceDiscount]
      ,[LineTotal]
 ,SalesOrderIDLineRotal = SUM([LineTotal]) OVER(PARTITION BY SalesOrderID)
 ,RankingwithROW = ROW_NUMBER() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC)
 ,RankingwithRank = RANK() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC)
 ,RankingwithDense_Rank = DENSE_RANK() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC)
 --,Ranking = ROW_NUMBER() OVER(ORDER BY [LineTotal] DESC)
 --,ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY SalesOrderDetailID) AS Ranking
      --,[rowguid]
      --,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]

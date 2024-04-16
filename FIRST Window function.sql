SELECT  [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[LineTotal]
 ,Ranking = ROW_NUMBER() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC)
 ,Highest_tortal = FIRST_VALUE([LineTotal]) OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC)
 ,Lowest_tortal = FIRST_VALUE([LineTotal]) OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] ASC)

  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]
  ORDER BY
  [SalesOrderID], [LineTotal] DESC

SELECT  
      [OrderDate]
     ,[CustomerID]
     ,[TotalDue]
,FirstOrderAmt = FIRST_VALUE(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate)
,LastOrderAmt = FIRST_VALUE(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate DESC)

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
  Order by CustomerID,OrderDate

SELECT  [SalesOrderID]
      ,[OrderDate]
      ,[AccountNumber]
      ,[CustomerID]
 ,[TotalDue]
 ,[NextTotalDue] = LEAD([TotalDue],1) OVER(PARTITION BY [CustomerID] ORDER BY [SalesOrderID])
 ,[PervTotalDue] = LAG([TotalDue],1) OVER(PARTITION BY [CustomerID] ORDER BY [SalesOrderID])

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
 
  ORDER BY [CustomerID] , [SalesOrderID]

SELECT
*
FROM
(
SELECT [PurchaseOrderID]

      ,[VendorID],[OrderDate],[TaxAmt]
      ,[Freight]
      ,[TotalDue]

 ,TheMostExpensive_ROW = ROW_NUMBER() OVER(Partition By[VendorID] Order By [TotalDue] DESC )
 ,TheMostExpensiveRANK = RANK() OVER(Partition By[VendorID] Order By [TotalDue] DESC )
 ,TheMostExpensiveDenseRank = DENSE_RANK() OVER(Partition By[VendorID] Order By [TotalDue] DESC )
  FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader]
  ) A
  WHERE TheMostExpensiveDenseRank <=3

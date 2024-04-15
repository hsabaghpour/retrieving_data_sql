SELECT [PurchaseOrderID]
      --,[RevisionNumber]
      --,[Status]
      ,[EmployeeID]
      --,[VendorID]
      --,[ShipMethodID]
      ,[OrderDate]
 ,[VendorName] = B.Name
      --,[ShipDate]
      --,[SubTotal]
      --,[TaxAmt]
      --,[Freight]
      ,[TotalDue]
 ,[PervOrderFromVendorAmt] = LAG([TotalDue],1) OVER(PARTITION BY A.VendorID Order by A.OrderDate)
 ,[NextOrderByEmployeeVendor] = LEAD (B.Name,1) OVER(PARTITION BY A.EmployeeID Order by A.OrderDate)
 ,[Next2OrderByEmployeeVendor] = LEAD  (B.Name,2) OVER(PARTITION BY A.EmployeeID Order by A.OrderDate)
      --,[ModifiedDate]

  FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader] A
  JOIN [Purchasing].[Vendor] B
  ON B.BusinessEntityID = A.VendorID
  Where A.OrderDate >= '2013' AND A.TotalDue > 500
  Order by A.VendorID , A.OrderDate

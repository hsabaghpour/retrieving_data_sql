SELECT
       
 OrderYear
 ,OrderMonth
 ,SubTotal
 ,Rolling3MonthTotal = SUM(SubTotal) OVER(ORDER BY OrderYear,OrderMonth ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
 ,MovingAvg6Month = AVG(SubTotal) OVER(ORDER BY OrderYear,OrderMonth ROWS BETWEEN 6 PRECEDING AND 1 PRECEDING)
 ,MovingAvgNext2Month = AVG(SubTotal) OVER(ORDER BY OrderYear,OrderMonth ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING)

FROM

(SELECT

      OrderMonth = MONTH([OrderDate])
 ,OrderYear = YEAR([OrderDate])
 ,SubTotal = SUM([SubTotal])
 

  FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader]
  GROUP BY
MONTH([OrderDate])
,YEAR([OrderDate])
  ) X

  ORDER BY OrderYear,OrderMonth

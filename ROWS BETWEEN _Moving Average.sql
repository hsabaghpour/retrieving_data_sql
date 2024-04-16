/*
In SQL, the ROWS BETWEEN clause is used with window functions (SUM, AVG, COUNT, MIN, MAX, etc.) to specify the range of rows (relative to the current row) that should be included in the calculation. This allows you to perform calculations such as running totals, moving averages, and other aggregations over a sliding window of rows.

Here is how the ROWS BETWEEN clause works:

Syntax: ROWS BETWEEN X PRECEDING AND Y FOLLOWING
X PRECEDING: The number of rows before the current row to include in the calculation.
Y FOLLOWING: The number of rows after the current row to include in the calculation.
The range can span multiple rows based on the current row's position and the specified offsets.
For example:

ROWS BETWEEN 2 PRECEDING AND CURRENT ROW means the range includes the current row and the two rows preceding it.
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING means the range includes the row immediately before the current row, the current row, and the row immediately following the current row.
Moving Average:
A moving average is a statistical calculation that calculates the average of a specific range of data points (e.g., a set of numbers) over a defined period. In SQL, this is typically calculated using a window function with the ROWS BETWEEN clause.

For example, a simple moving average over three days (including the current day) can be calculated using the following query:

sql
Copy code
AVG(SumTotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
This calculates the average SumTotalDue value for the current day (CURRENT ROW) and the two preceding days (2 PRECEDING). The result is a moving average of the SumTotalDue values over the specified window.

Moving averages help smooth out fluctuations in data and are often used in time series analysis to identify trends and patterns over time.
*/
SELECT
OrderDate
,SumTotalDue
,SalesLast3Days_including_current_row = SUM(SumTotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
,SalesLast3Days_excluding_current_row = SUM(SumTotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING)
,SalesLast3Days_1day_before_after_including = SUM(SumTotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
,Moving_Avergae = AVG(SumTotalDue) OVER(ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM(
SELECT  
[OrderDate]
,[SumTotalDue]= SUM(TotalDue)

 
FROM
[AdventureWorks2019].[Sales].[SalesOrderHeader]
WHERE YEAR(OrderDate) = 2014
Group by
OrderDate

  ) X

  Order by
OrderDate


SELECT COUNT(*) FROM your_table WHERE EXTRACT(DOW FROM date_column) = 1 AND statement_column = 'your_specific_statement';

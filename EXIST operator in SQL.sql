SELECT first_name,last_name
FROM customer AS C
WHERE (NOT)EXISTS
(SELECT * FROM payment as p
WHERE p.customer_id = c.customer_id
AND amount > 11)

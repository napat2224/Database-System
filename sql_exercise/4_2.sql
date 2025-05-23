SELECT postal_code, COUNT(*) AS customer_number 
FROM customer
GROUP BY postal_code
HAVING COUNT(*) > 1
ORDER BY customer_number DESC;

SELECT postal_code, COUNT(*) AS customer_number 
FROM customer
GROUP BY postal_code
ORDER BY customer_number DESC;
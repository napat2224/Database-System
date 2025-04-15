SELECT customer_id, customer_name
FROM customer
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM ordert);
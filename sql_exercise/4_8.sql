SELECT customer_id, customer_name, COUNT(order_id) AS order_count
FROM customer
JOIN ordert USING(customer_id)
GROUP BY customer_id, customer_name
ORDER BY order_count DESC
LIMIT 3;

select c.customer_id, c.customer_name, count(*) as order_count
from customer c
natural join ordert
group by customer_id
order by count(*) DESC
limit 3;
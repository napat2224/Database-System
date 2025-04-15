-- SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS order_count
-- FROM customer c
-- LEFT JOIN ordert o ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id, c.customer_name
-- HAVING COUNT(o.order_id) > 0
-- ORDER BY order_count DESC;

select c.customer_id, c.customer_name, abc.number_of_order
from customer c ,(
	select o.customer_id, count(*) as number_of_order
	from ordert o
	group by o.customer_id
	order by number_of_order DESC
) as abc
where c.customer_id = abc.customer_id
order by abc.number_of_order DESC

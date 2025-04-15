-- SELECT customer_id, customer_name
-- FROM (
--     SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS order_count,
--            RANK() OVER (ORDER BY COUNT(o.order_id) DESC) AS rnk
--     FROM customer c
--     LEFT JOIN ordert o ON c.customer_id = o.customer_id
--     GROUP BY c.customer_id, c.customer_name
-- ) ranked
-- WHERE rnk = 1;

select c.customer_id, c.customer_name
from customer c ,(
	select o.customer_id, count(*) as number_of_order
	from ordert o
	group by o.customer_id
	having count(*) = (
		select max(order_count)
		from (
			select count(*) as order_count
			from ordert o3
			group by o3.customer_id
		) as k
	)
) as abc
where c.customer_id = abc.customer_id

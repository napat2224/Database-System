-- SELECT product_id, product_description FROM product
-- WHERE product_id = (
-- 	SELECT product_id FROM order_line
-- 	GROUP BY product_id
-- 	ORDER BY SUM(ordered_quantity) DESC
-- 	LIMIT 1
-- )

select p.product_id, p.product_description
from product p
where p.product_id in (
	select ol2.product_id
	from order_line ol2
	group by ol2.product_id
	having sum(ol2.ordered_quantity) = (
		select max(total_quantity)
		from (
			select sum(ol3.ordered_quantity) as total_quantity
			from order_line ol3
			group by ol3.product_id
		) as max_sum
	)
)
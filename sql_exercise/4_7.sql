-- SELECT product_id, product_description
-- FROM product
-- WHERE product_id = (
--     SELECT product_id FROM order_line
--     GROUP BY product_id
--     ORDER BY SUM(ordered_quantity) DESC
--     LIMIT 1
-- )

select p.product_id, p.product_description
from product p
where p.product_id in (
	select ol.product_id
	from order_line ol
	group by ol.product_id
	having count(*) = (
		select max(tmp)
		from(
			select count(*) as tmp
			from order_line ol3
			group by ol3.product_id
		) as a
	)
)
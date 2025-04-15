SELECT DISTINCT c.customer_id, c.customer_name
FROM customer c
JOIN ordert o ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2020-01-10' AND '2020-01-15';

select c.customer_id, c.customer_name from customer c
where c.customer_id in (
select distinct customer_id from ordert
where order_date between '2020-01-10' and '2020-01-15'
)
SELECT COUNT(*) AS total_orders
FROM ordert
WHERE order_date::DATE BETWEEN '2020-01-10' AND '2020-01-15';

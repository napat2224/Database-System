SELECT SUM(ol.ordered_quantity * p.standard_price) AS total_payment
FROM order_line ol
JOIN product p ON ol.product_id = p.product_id
WHERE ol.order_id = 3;

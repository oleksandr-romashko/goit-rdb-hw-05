USE mydb;

SELECT product_id, SUM(quantity) AS ordered_product_total 
FROM order_details
GROUP BY product_id
ORDER BY ordered_product_total DESC, product_id ASC;
USE mydb;

-- Tested with MySQL version 8.4.2
WITH temp_table AS 
(
  SELECT order_id, quantity
  FROM order_details 
  WHERE quantity > 10
)
SELECT order_id, AVG(quantity) AS average_products_quantity
FROM temp_table
GROUP BY order_id;
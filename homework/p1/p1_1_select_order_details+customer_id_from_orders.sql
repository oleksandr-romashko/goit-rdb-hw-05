USE mydb;

SELECT 
    *, 
    (SELECT customer_id FROM orders WHERE orders.id = order_details.order_id ) AS customer_id
FROM order_details;
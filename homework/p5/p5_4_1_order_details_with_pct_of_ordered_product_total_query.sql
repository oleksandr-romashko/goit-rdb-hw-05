WITH total_ordered_table AS
(
    SELECT product_id, SUM(quantity) AS total_ordered 
    FROM order_details
    GROUP BY product_id
)
SELECT 
    id,
    order_id,
    order_details.product_id,
    quantity,
    (
        SELECT ROUND(fn_divide_numbers(quantity, total_ordered) * 100, 2)
    ) AS pct_of_ordered_product_total
FROM order_details
INNER JOIN 
    total_ordered_table 
    ON order_details.product_id = total_ordered_table.product_id;

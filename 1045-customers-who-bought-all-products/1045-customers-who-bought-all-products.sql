# Write your MySQL query statement below
WITH total_products AS (
    SELECT COUNT(*) AS product_count
    FROM Product
)

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT product_count FROM total_products);
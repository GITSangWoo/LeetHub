-- 1. 최신 가격 있는 제품
SELECT p.product_id, p.new_price AS price
FROM Products p
JOIN (
    SELECT product_id, MAX(change_date) AS latest_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
) sub
  ON p.product_id = sub.product_id AND p.change_date = sub.latest_date

UNION ALL

-- 2. 그 외 제품은 가격 10
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
)
GROUP BY product_id;

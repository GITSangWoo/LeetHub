# Write your MySQL query statement below
WITH first_years AS (
    SELECT product_id,MIN(year) as first_year 
    FROM Sales
    GROUP BY product_id 
)
SELECT s.product_id,s.year as first_year,SUM(quantity)as quantity,s.price
FROM Sales s inner join first_years f
on  s.product_id = f.product_id and s.year = f.first_year
Group BY s.product_id,s.price 



 

/* Write your PL/SQL query statement below */
Select product_name, year, price 
    from Sales A inner join Product B
         on A.product_id=B.product_id
# Write your MySQL query statement below
 select product_id, IFNULL(round(sum(pxu)/sum(units),2),0) as average_price
from (
select u.product_id as product_id ,u.purchase_date, u.units as units ,price*units as pxu
from Prices p right join UnitsSold u
on p.product_id=u.product_id and purchase_date between start_date and end_date 
)as sub 
group by product_id
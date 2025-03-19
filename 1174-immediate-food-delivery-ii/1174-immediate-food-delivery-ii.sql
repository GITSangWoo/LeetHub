
select Round(Count(case when d.order_date = d.customer_pref_delivery_date then 1 end )/count(sub.customer_id)*100,2) as immediate_percentage
from 
(select customer_id,min(order_date) as first_order_date
from Delivery
group by customer_id) as sub join Delivery as d 
on sub.customer_id = d.customer_id and sub.first_order_date = d.order_date  

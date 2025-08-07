# Write your MySQL query statement below
with days as (
    select visited_on 
    from Customer 
    where visited_on >= (select min(visited_on) from Customer) + 6 
    group by visited_on
),
daysum as (
    select visited_on,sum(amount) over (order by visited_on RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW ) as amount 
    from (
        select SUM(amount) as amount,visited_on
        from Customer
        group by visited_on
        ) as sub
    group by visited_on 
)

select d.visited_on, ds.amount, ROUND(ds.amount/7, 2) as average_amount
from days d left join daysum ds 
on d.visited_on = ds.visited_on
order by d.visited_on 
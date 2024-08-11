# Write your MySQL query statement below
select id 
From (
    select id,temperature,LAG(temperature) over(order by recordDate) as prev_temperature, recordDate,Lag(recordDate)over(order by recordDate) as prev_date from weather)as subquery
where temperature > prev_temperature and DATEDIFF(recordDate, prev_date) = 1

-- lag(함수) over(order by ), 서브쿼리, DATEDIFF() 함수 , 정렬 조건 
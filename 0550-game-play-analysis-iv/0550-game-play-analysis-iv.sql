-- select *
-- from Activity
-- group by player_id,device_id
-- order by player_id,event_date

-- select *, FIRST_VALUE(event_date)OVER(partition by player_id, device_id order by player_id) as first_logged_date 
-- ,LEAD(event_date,1) OVER(partition by player_id,device_id order by player_id,event_date) as second_played_date
-- from Activity

-- select *, FIRST_VALUE(event_date)OVER(partition by player_id order by event_date) as first_logged_date 
-- ,LEAD(event_date,1) OVER(partition by player_id order by player_id,event_date) as second_played_date
-- from Activity

-- select *, FIRST_VALUE(event_date)OVER(partition by player_id,device_id order by event_date) as first_logged_date 
-- ,LEAD(event_date,1) OVER(partition by player_id,device_id order by player_id,event_date) as second_played_date
-- from Activity

-- select sub.player_id,sub.device_id, case when sub.first_logged_date - sub.second_played_date = -1 then 1 END as special_user 
-- from 
-- (select *, FIRST_VALUE(event_date)OVER(partition by player_id, device_id order by player_id) as first_logged_date 
-- ,LEAD(event_date,1) OVER(partition by player_id,device_id order by player_id,event_date) as second_played_date
-- from Activity) as sub
-- where sub.first_logged_date - sub.second_played_date = - 1



-- select ROUND(count(case when sub.first_logged_date - sub.second_played_date = -1 then 1 END)/count(DISTINCT sub.player_id) as fraction
-- from 
-- (select *, FIRST_VALUE(event_date)OVER(partition by player_id,device_id order by event_date) as first_logged_date 
-- ,LEAD(event_date,1) OVER(partition by player_id,device_id order by player_id,event_date) as second_played_date
-- from Activity) as sub


select round(count(case when DATEDIFF(sub.first_logged_date,sub.second_played_date) = -1 then 1 END)/count(DISTINCT sub.player_id),2) as fraction
from 
(select *, FIRST_VALUE(event_date)OVER(partition by player_id order by event_date) as first_logged_date 
,LEAD(event_date,1) OVER(partition by player_id order by player_id,event_date) as second_played_date
from Activity) as sub


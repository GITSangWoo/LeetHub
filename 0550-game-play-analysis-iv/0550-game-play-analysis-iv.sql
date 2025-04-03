select round(count(case when DATEDIFF(sub.first_logged_date,sub.second_played_date) = -1 then 1 END)/count(DISTINCT sub.player_id),2) as fraction
from 
(select *, FIRST_VALUE(event_date)OVER(partition by player_id order by event_date) as first_logged_date 
,LEAD(event_date,1) OVER(partition by player_id order by player_id,event_date) as second_played_date
from Activity) as sub


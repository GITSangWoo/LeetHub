with request_cnt as (
    SELECT requester_id,count(distinct accepter_id)  as accnt
    FROM RequestAccepted
    GROUP BY requester_id 
) 
, accept_cnt as (
    SELECT accepter_id,count(Distinct requester_id) as recnt
    FROM RequestAccepted 
    Group BY accepter_id
),
friends_list as (
    select distinct requester_id as id
    FROM RequestAccepted

    UNION 

    select distinct accepter_id as id
    FROM RequestAccepted
)

select id, IFNULL(recnt,0)+IFNULL(accnt,0) as num
FROM friends_list f 
left join request_cnt r on f.id = r.requester_id 
left join accept_cnt a  on f.id = a.accepter_id
ORDER BY num desc
LIMIT 1



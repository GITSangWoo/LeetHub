with UserRank as (
    SELECT * FROM(
    SELECT mr.user_id,u.name,count(*) as ratecnt
    FROM MovieRating mr left join Users u 
    on mr.user_id = u.user_id
    GROUP BY mr.user_id
    ORDER BY ratecnt DESC, u.name ASC
    LIMIT 1) as p1
),
MovieRank as (
    SELECT * FROM (
    SELECT mr.movie_id, m.title,avg(rating) as rateavg
    from MovieRating mr left join Movies m 
    on mr.movie_id = m.movie_id
    where created_at BETWEEN '2020-02-01' and '2020-02-29'
    group by mr.movie_id
    order by rateavg DESC,m.title ASC
    LIMIT 1
    ) as p2
    
)
SELECT name as results
from UserRank 



UNION ALL

SELECT title as results
FROM MovieRank 


    



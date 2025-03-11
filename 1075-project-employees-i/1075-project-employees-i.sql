# Write your MySQL query statement below
# 프로젝트별 근무자들 평균 경력 출력하기 
# select
Select p.project_id, ROUND(AVG(e.experience_years),2) as average_years
From Project p LEFT JOIN Employee e  
on  p.employee_id = e.employee_id 
Group BY p.project_id

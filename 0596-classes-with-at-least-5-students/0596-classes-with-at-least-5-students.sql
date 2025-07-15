# Write your MySQL query statement below
Select Class 
from Courses
Group BY class
Having count(class) >=5
/* Write your PL/SQL query statement below */
Select student_id, student_name, subject_name 
From Students s full outer join Examinations e
on s.student_id = e.student_id
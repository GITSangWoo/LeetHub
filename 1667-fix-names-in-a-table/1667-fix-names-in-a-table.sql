select user_id, CONCAT(UPPER(SUBSTRING(name,1,1)),LOWER(SUBSTRING(name,2,LENGTH(name)))) AS name  
from Users 
Order by user_id 

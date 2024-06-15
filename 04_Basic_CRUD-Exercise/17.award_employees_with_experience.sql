UPDATE employees  
SET 
	salary = salary + 1500,
	job_title = CONCAT('Senior', ' ', job_title)
WHERE 
	hire_date between '1998-01-01' and '2000-01-05' ;
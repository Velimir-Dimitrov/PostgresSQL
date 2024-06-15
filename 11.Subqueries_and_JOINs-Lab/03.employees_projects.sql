SELECT
	employee_id,
	CONCAT(
		first_name,
		' ',
		last_name
	) AS full_name,
	project_id,
	name
FROM
	employees
JOIN 
	employees_projects
        USING
	        (employee_id)
    JOIN
	    projects
            USING
	            (project_id)
WHERE
	project_id = 1
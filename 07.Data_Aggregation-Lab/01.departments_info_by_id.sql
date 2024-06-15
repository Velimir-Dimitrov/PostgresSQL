SELECT
	department_id,
	COUNT(department_id) as employee_count

FROM
	employees 
GROUP BY
	department_id
ORDER BY
	department_id;
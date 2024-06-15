SELECT
	v.name AS volunteers,
	v.phone_number,
	TRIM(TRANSLATE(REPLACE(v.address, 'Sofia', ''), ',', '')) AS address
FROM
	volunteers AS v
JOIN
	volunteers_departments AS v_d
ON 
	v_d.id = v.department_id
WHERE
	v_d.department_name = 'Education program assistant'
		AND
	v.address LIKE '%Sofia%'
ORDER BY
	v.name ASC
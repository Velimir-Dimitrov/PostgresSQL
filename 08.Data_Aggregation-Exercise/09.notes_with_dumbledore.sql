SELECT
	last_name,
	COUNT('note_with_dumbledore') AS note_with_dumbledore
FROM 
	wizard_deposits
WHERE
	noteS LIKE '%Dumbledore%'
GROUP BY
	last_name;
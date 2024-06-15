SELECT
	a.name AS animal,
	to_char(a.birthdate, 'YYYY') AS birth_year,
	a_t.animal_type
FROM
	animals AS a
JOIN
	animal_types AS a_t
ON
	a.animal_type_id = a_t.id
WHERE

	a.birthdate >= '01/01/2017'
		AND
	a_t.animal_type <> 'Birds'
		AND
	a.owner_id IS NULL
ORDER BY
	a.name ASC
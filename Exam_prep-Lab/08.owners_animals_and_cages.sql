SELECT
	CONCAT(o.name, ' - ', a.name) AS "owners - animals",
	o.phone_number,
	a_c.cage_id
FROM
	owners AS o
JOIN
	animals AS a
ON
	o.id = a.owner_id
JOIN
	animals_cages AS a_c
ON
	a.id = a_c.animal_id
JOIN
	animal_types AS a_t
ON
	a.animal_type_id = a_t.id
WHERE
	a_t.animal_type = 'Mammals'
ORDER BY
	o.name ASC,
	a.name DESC
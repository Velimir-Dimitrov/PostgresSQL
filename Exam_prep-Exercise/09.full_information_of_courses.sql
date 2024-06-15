SELECT
	a.name AS address,
	CASE 
		WHEN EXTRACT(HOUR FROM c.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	c.bill,
	cl.full_name,
	ca.make,
	ca.model,
	cat.name AS category_name
FROM
	courses AS c
JOIN
	addresses AS a
ON
	a.ID = c.from_address_id
JOIN
	clients AS cl
ON
	cl.id = c.client_id
JOIN
	cars AS ca
ON
	ca.id = c.car_id
JOIN
	categories AS cat
ON
	cat.id = ca.category_id
ORDER BY
	c.id
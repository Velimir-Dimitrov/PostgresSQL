SELECT
	first_name,
	last_name,
	make,
	model,
	mileage
FROM
	drivers AS dr
JOIN
	cars_drivers AS c_d
ON
	dr.id = c_d.driver_id
JOIN
	CARS AS c
ON
	C.ID = c_d.car_id
WHERE
	mileage IS NOT NULL
ORDER BY
	mileage DESC,
	FIRST_NAME ASC
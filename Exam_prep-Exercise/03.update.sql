UPDATE
	cars
SET
	condition = 'C'
WHERE
	(MILEAGE >= 800000 OR MILEAGE IS NULL)
		AND
	YEAR <= 2010
		AND
	MAKE <> 'Mercedes-Benz' 
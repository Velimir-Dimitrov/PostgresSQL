DELETE FROM
    addresses
WHERE
	id % 2 = 0
		and
	LOWER(street) LIKE '%r%'
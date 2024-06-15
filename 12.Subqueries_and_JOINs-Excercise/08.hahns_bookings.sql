SELECT
	COUNT(*)
FROM
	bookings
JOIN
	customers
USING
	(customer_id)
WHERE
	last_name = 'Hahn'
SELECT
	booking_id,
	starts_at:: DATE,
	apartment_id,
	CONCAT(
	first_name,
	' ',
	last_name
	) AS customer_name
FROM 
	bookings
RIGHT JOIN
	customers
USING
	(customer_id)
ORDER BY
	customer_name ASC
LIMIT 10
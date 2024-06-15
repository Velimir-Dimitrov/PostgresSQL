SELECT
	ca.id AS car_id,
	ca.make,
	ca.mileage,
	COUNT(co.BILL) AS count_of_courses,
	ROUND(AVG(co.bill), 2) AS average_bill
FROM
	cars as ca
LEFT JOIN
	courses as  co
ON
	co.car_id = ca.id
GROUP BY
	ca.id,
	ca.make,
	ca.mileage
HAVING 
	COUNT(co.id) <> 2
ORDER BY
	count_of_courses DESC,
	ca.id
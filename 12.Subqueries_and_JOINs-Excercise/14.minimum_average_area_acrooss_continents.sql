SELECT
	min(average_area_per_continent) AS min_average_area 
FROM
	(SELECT
		AVG(area_in_sq_km) AS average_area_per_continent
	FROM
		countries
	GROUP BY
		continent_code) AS average_table
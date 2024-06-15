CREATE VIEW view_continents_countries_currencies_details
AS
SELECT  
	CONCAT(
		TRIM(con.continent_name), 
		': ', 
		con.continent_code
	) AS continent_details,
	CONCAT_WS(
		' - ',
		cou.country_name,
		cou.capitaL,
		cou.area_in_sq_km,
		'km2'
	) AS country_information,
	CONCAT(
		cur.description,
		' (',
		cur.currency_code,
		')'
	) AS currencies
FROM
	continents as con,
	countries as cou,
	currencies as cur
WHERE
	con.continent_code = cou.continent_code
		AND
	cou.currency_code = cur.currency_code
ORDER BY
	country_information ASC,
	currencies ASC;
SELECT 
	continent_name,
	trim(LEADING FROM continent_name) AS trim
    -- LTRIM(continent_name) AS "trim" 
FROM
	continents 
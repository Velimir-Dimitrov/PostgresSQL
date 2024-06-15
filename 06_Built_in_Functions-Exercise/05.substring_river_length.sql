SELECT 
	UNNEST(
        regexp_match(
            "River Information", '([0-9]{1,4})' 
            )) as river_lenght
FROM
	view_river_info
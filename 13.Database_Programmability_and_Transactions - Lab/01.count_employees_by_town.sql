CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT
AS
$$
	DECLARE "count" INT;
	BEGIN
		SELECT
			COUNT(*) INTO "count"
		FROM
			towns
		JOIN
			addresses
		USING
			(town_id)
		JOIN
			employees
		USING
			(address_id)
		WHERE
			towns.name = town_name;
		RETURN "count";
	END;
$$
LANGUAGE plpgsql;
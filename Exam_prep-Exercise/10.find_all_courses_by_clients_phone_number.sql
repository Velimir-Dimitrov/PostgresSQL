CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT
as
$$
DECLARE
	courses_num INT;
BEGIN
	SELECT

		COUNT(CO.ID) INTO courses_num
	FROM
		clients AS cl
	JOIN
		courses AS co
	ON
		cl.id = co.client_id
	WHERE
		CL.phone_number = phone_num;
	RETURN courses_num;
END;
$$
LANGUAGE plpgsql;

-- TESTS

-- SELECT fn_courses_by_client('(803) 6386812')
-- SELECT fn_courses_by_client('(831) 1391236')
-- SELECT fn_courses_by_client('(704) 2502909')

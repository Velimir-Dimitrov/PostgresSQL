CREATE OR REPLACE PROCEDURE sp_increase_salaries( IN department_name VARCHAR(20))
LANGUAGE plpgsql
AS
$$
	BEGIN
		UPDATE
			employees AS e
		SET
		    salary = salary * 1.05
		FROM
			departments AS d
		WHERE
			e.department_id = d.department_id
				and 
			d.name = department_name;
	END;
$$;

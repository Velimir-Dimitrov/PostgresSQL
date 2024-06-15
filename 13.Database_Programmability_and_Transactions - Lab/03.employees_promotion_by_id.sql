CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id("id" INT)
LANGUAGE plpgsql
AS
$$
	BEGIN
		UPDATE
			employees
		SET
			salary = salary * 1.05
		WHERE
			employee_id = "id";
		IF NOT found THEN ROLLBACK;
		ELSE COMMIT;
		END IF;
	END;
$$;
CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30)) 
RETURNS INT
AS
$$
BEGIN
	RETURN (
		SELECT
			count(a_p.photo_id)
		FROM
			accounts AS a
		JOIN
			accounts_photos AS a_p
		ON
			a.id = a_p.account_id
		WHERE
			username = account_username
	);
END;
$$
Language plpgsql;

-- SELECT udf_accounts_photos_count('ssantryd') AS photos_count;


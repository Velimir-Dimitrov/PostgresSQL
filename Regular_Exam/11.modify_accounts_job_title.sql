CREATE OR REPLACE PROCEDURE udp_modify_account(address_street VARCHAR(30), address_town VARCHAR(30))
AS
$$
BEGIN
	UPDATE
		accounts AS ac
	SET	
		job_title = CONCAT('(Remote) ', job_title)
	from
		addresses AS ad
	WHERE
		ad.account_id = ac.id
			AND
		ad.street = address_street
			AND
		ad.town = address_town;
END;
$$
Language plpgsql;

-- TEST1
-- CALL udp_modify_account('97 Valley Edge Parkway', 'Nonexistent');
-- SELECT a.username, a.gender, a.job_title FROM accounts AS a
-- WHERE a.job_title ILIKE '(Remote)%';

-- TEST2
-- CALL udp_modify_account('97 Valley Edge Parkway', 'Divinópolis');
-- SELECT a.username, a.gender, a.job_title FROM accounts AS a
-- WHERE a.job_title ILIKE '(Remote)%';
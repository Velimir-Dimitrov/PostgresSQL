SELECT
	CONCAT(id, ' ', username) AS id_username,
	email
FROM
	accounts AS a
LEFT JOIN
	accounts_photos AS a_p
ON
	a.id = a_p.account_id
WHERE
	a.id = a_p.photo_id
ORDER BY
	a.id ASC
SELECT
	title
FROM
	books
WHERE
	 substring(title, 1, 4) = 'The ';
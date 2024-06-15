SELECT
	p.id AS photo_id,
	p.capture_date,
	p.description,
	COUNT(c.id) AS comments_count
FROM
	comments AS c
JOIN
	photos AS p
ON
	c.photo_id = p.id
WHERE
	p.description IS NOT NULL 
GROUP BY
	p.id,
	p.capture_date,
	p.description
ORDER BY
	comments_count DESC,
	p.id ASC
LIMIT 3
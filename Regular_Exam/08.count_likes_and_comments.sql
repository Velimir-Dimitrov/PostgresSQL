SELECT 
	p.id AS photo_id,
	COUNT(distinct l.id) AS like_count,
	COUNT(distinct C.id) AS comments_count
FROM 
	photos AS p 
LEFT JOIN 
	likes AS l 
ON 
	p.id = l.photo_id
LEFT JOIN
	comments AS c
ON
	p.id = c.photo_id
GROUP BY
	p.id
ORDER BY
	like_count DESC,
	comments_count DESC,
	photo_id ASC
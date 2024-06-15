DELETE 
FROM 
    clients  AS cl
WHERE 
    LENGTH(cl.full_name) > 3 
        AND 
    cl.id NOT IN (SELECT client_id FROM courses)
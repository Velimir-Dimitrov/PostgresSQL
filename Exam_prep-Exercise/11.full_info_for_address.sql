CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50));

CREATE OR REPLACE PROCEDURE sp_courses_by_address(address_name VARCHAR(100))
AS
$$
BEGIN
	TRUNCATE search_results;
	INSERT INTO search_results (address_name, full_name , level_of_bill, make, condition, category_name)
	SELECT
        add.name AS address_name,
        cli.full_name,
        CASE
            WHEN bill <= 20 THEN 'Low'
            WHEN bill <= 30 THEN 'Medium'
            ELSE 'High' 
            END AS level_of_bill,
        ca.make,
        ca.condition,
        cat.name AS category_name
    FROM
        addresses AS add
    JOIN
        courses AS cou
    ON
        add.id = cou.from_address_id
    JOIN
        clients AS cli
    ON
        cli.id = cou.client_id
    JOIN
        cars AS ca
    ON
        ca.id = cou.car_id
    JOIN
        categories AS cat
    ON
        cat.id = ca.category_id
    WHERE
        add.name = address_name
    ORDER BY
        ca.make,
        cli.full_name;
END;
$$
Language plpgsql;

-- TEST1

-- CALL sp_courses_by_address('700 Monterey Avenue')
-- SELECT * FROM search_results;

-- TEST2

-- CALL sp_courses_by_address('66 Thompson Drive')
-- SELECT * FROM search_results;


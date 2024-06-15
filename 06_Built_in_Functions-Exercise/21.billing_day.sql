ALTER TABLE 
	bookings
ADD COLUMN 
	billing_day TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

SELECT
	to_CHAR(billing_day, 'DD "Day" MM "Month" yyyy "Year" HH24:MI:SS') AS "Billing Day"
FROM 
	bookings
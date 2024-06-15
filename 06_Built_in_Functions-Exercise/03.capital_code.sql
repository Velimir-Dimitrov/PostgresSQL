ALTER TABLE 
	countries
ADD 
	capital_code HAR(2) ;

UPDATE 
	countries
SET 
	capital_code = SUBSTRING(capital, 1, 2);
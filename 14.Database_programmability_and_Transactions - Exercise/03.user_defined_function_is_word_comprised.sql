CREATE OR REPLACE FUNCTION fn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS BOOLEAN
AS
$$	
	DECLARE
		ch VARCHAR(1);
		comprised_word VARCHAR(50) := '';
		array_set_of_letterst text[] := regexp_split_to_array(set_of_letters, '');
	BEGIN
		FOREACH ch IN ARRAY array_set_of_letters
		LOOP
			IF LOWER(word) LIKE '%' ||LOWER(ch)|| '%' THEN
				comprised_word := comprised_word || ch;
			END IF;
			IF LENGTH(comprised_word) = LENGTH(word) THEN
				RETURN TRUE;
			END IF;
		END LOOP;
		RETURN FALSE;
	END;
$$
LANGUAGE plpgsql;

-- fn_is_word_comprised('ois tmiah%f', 'halves')
-- fn_is_word_comprised('ois tmiah%f', 'Sofia')
-- fn_is_word_comprised('bobr', 'Rob')
-- fn_is_word_comprised('papopep', 'toe')
-- fn_is_word_comprised('R@o!B$B', 'Bob')


/* 
CREATE OR REPLACE FUNCTION fn_is_word_comprised (
	set_of_letters VARCHAR(50),
	word VARCHAR(50)
) RETURNS BOOLEAN
AS 
$$
BEGIN
	RETURN TRIM(LOWER(word), LOWER(set_of_letters)) = '';
END;
$$
LANGUAGE plpgsql; 
*/
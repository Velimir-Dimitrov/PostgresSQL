CREATE OR REPLACE FUNCTION fn_calculate_future_value(initial_sum DECIMAL, yearly_interest_rate DECIMAL, number_of_years INT)
RETURNS DECIMAL
AS
$$
	DECLARE
		future_value DECIMAL;
	BEGIN
		future_value := initial_sum * ((1 + yearly_interest_rate)^number_of_years);
		RETURN TRUNC(future_value, 4);
	END;
$$
LANGUAGE plpgsql;

-- fn_full_name('fred', 'sanford')
-- fn_full_name('', 'SIMPSONS')
-- fn_full_name('JOHN', '')
-- fn_full_name(NULL, NULL)

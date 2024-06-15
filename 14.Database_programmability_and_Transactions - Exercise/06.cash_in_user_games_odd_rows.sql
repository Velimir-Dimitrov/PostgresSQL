CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
RETURNS	table (total_cash NUMERIC)
AS
$$
BEGIN
	RETURN QUERY
	SELECT
		ROUND(SUM(cash),2)
	FROM
		(SELECT
			g.name,
			u_g.cash,
			ROW_NUMBER() OVER (ORDER BY u_g.cash DESC) AS rn
		FROM
			users_games AS u_g
		JOIN
			games AS g
		ON
			u_g.game_id = g.id
		WHERE
			g.name = game_name
		) AS table_rows
	WHERE
		rn % 2 <> 0;
	END;
$$
LANGUAGE plpgsql;

-- fn_cash_in_users_games('Love in a mist')
-- fn_cash_in_users_games('Delphinium Pacific Giant')

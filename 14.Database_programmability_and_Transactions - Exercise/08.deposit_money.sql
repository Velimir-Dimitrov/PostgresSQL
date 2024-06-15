CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INT, money_amount NUMERIC(4))
AS
$$
	BEGIN
		UPDATE accounts SET balance = balance + money_amount WHERE account_id = id;
		COMMIT;
	END;
$$
LANGUAGE plpgsql;


--- sp_deposit_money(1, 200)
--- sp_deposit_money(10, 500)
--- sp_deposit_money(14, 1000)
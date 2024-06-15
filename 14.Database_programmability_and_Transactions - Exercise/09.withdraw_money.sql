CREATE OR REPLACE PROCEDURE sp_withdraw_money(account_id INT, money_amount NUMERIC(4))
AS
$$
	DECLARE
		current_balance NUMERIC := (SELECT balance FROM accounts WHERE id = account_id);
	BEGIN
	IF current_balance >= money_amount THEN
		UPDATE accounts SET balance = balance - money_amount WHERE id = account_id;
		COMMIT;
	ELSE RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
	END IF;
	END;
$$
LANGUAGE plpgsql;

--- CALL sp_withdraw_money(3, 5050.7500)
--- CALL sp_withdraw_money(6, 5437.0000)

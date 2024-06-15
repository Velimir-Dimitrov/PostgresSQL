CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id INT, receiver_id INT, amount NUMERIC(4))
AS
$$	
DECLARE
	current_balance NUMERIC;
	BEGIN
		CALL sp_withdraw_money(sender_id, amount);
		CALL sp_deposit_money(receiver_id, amount);

		SELECT balance INTO current_balance FROM accounts WHERE accounts.id = sender_id;

		IF current_balance < amount THEN
			ROLLBACK;
		END IF;
	END;
$$
Language plpgsql;

--- CALL sp_transfer_money(5, 1, 5000.0000)
--- CALL sp_transfer_money(10, 2, 1043.9000)
--- CALL sp_transfer_money(13, 15, 400.9000)
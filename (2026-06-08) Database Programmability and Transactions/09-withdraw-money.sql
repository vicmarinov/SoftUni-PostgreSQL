CREATE OR REPLACE PROCEDURE sp_withdraw_money (
    account_id INT,
    money_amount NUMERIC(4)
)
LANGUAGE plpgsql
AS
$$
DECLARE
    account_balance NUMERIC;
BEGIN
    account_balance = (
        SELECT balance FROM accounts
        WHERE id = account_id
    );

    IF money_amount > account_balance
    THEN
        RAISE NOTICE 'NOTICE: Insufficient balance to withdraw %', money_amount;
        RETURN;
    END IF;

    UPDATE accounts
    SET balance = balance - money_amount
    WHERE id = account_id;
END;
$$;

CALL sp_withdraw_money(3, 5050.750);
CALL sp_withdraw_money(6, 5437.000);

SELECT * FROM accounts
WHERE id IN (3, 6);
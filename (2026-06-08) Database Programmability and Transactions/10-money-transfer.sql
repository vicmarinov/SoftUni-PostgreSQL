CREATE PROCEDURE sp_transfer_money (
    sender_id INT,
    receiver_id INT,
    money_amount NUMERIC(4)
)
LANGUAGE plpgsql
AS
$$
DECLARE
    old_sender_balance NUMERIC;
    new_sender_balance NUMERIC;
BEGIN
    old_sender_balance = (
        SELECT balance FROM accounts
        WHERE id = sender_id
    );

    CALL sp_withdraw_money(sender_id, money_amount);

    new_sender_balance = (
        SELECT balance FROM accounts
        WHERE id = sender_id
    );

    IF NOT new_sender_balance < old_sender_balance
    THEN
        ROLLBACK;
        RETURN;
    END IF;

    CALL sp_deposit_money(receiver_id, money_amount);

    COMMIT;
END;
$$;

CALL sp_transfer_money(5, 1, 5000.0000);

SELECT * FROM accounts
WHERE id IN (5, 1);

CALL sp_transfer_money(10, 2, 1043.9000);

SELECT * FROM accounts
WHERE id IN (10, 2);
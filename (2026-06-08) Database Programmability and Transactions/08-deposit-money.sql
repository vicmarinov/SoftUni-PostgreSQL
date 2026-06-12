CREATE PROCEDURE sp_deposit_money (
    account_id INT,
    money_amount NUMERIC(4)
)
LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE accounts
    SET balance = balance + money_amount
    WHERE id = account_id;
END;
$$;

CALL sp_deposit_money(1, 200);

SELECT * FROM accounts
WHERE id = 1;
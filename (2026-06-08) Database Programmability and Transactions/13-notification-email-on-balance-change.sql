CREATE TABLE notification_emails (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recipient_id INT,
    subject VARCHAR(50),
    body VARCHAR(100)
);

CREATE FUNCTION trigger_fn_send_email_on_balance_change ()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO notification_emails(recipient_id, subject, body)
    VALUES
        (
            NEW.account_id,
            CONCAT('Balance change for account: ', NEW.account_id),
            CONCAT(
                    'On ',
                    TO_CHAR(NOW(), 'yyyy-mm-dd'),
                    ' your balance was changed from ',
                    NEW.old_sum,
                    ' to ',
                    NEW.new_sum,
                    '.'
            )
        );

    RETURN NEW;
END;
$$;

CREATE TRIGGER tr_send_email_on_balance_change
AFTER UPDATE ON logs
FOR EACH ROW EXECUTE FUNCTION trigger_fn_send_email_on_balance_change();

UPDATE logs
SET new_sum = new_sum + 100
WHERE account_id = 1;

SELECT * FROM notification_emails;
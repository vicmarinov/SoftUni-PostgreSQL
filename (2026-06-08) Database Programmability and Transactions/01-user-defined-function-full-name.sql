CREATE OR REPLACE FUNCTION fn_full_name (
    first_name VARCHAR,
    last_name VARCHAR
) RETURNS VARCHAR
LANGUAGE plpgsql
AS
$$
BEGIN
    IF first_name IS NULL AND last_name IS NULL
    THEN RETURN NULL;
    END IF;

    first_name = INITCAP(first_name);
    last_name = INITCAP(last_name);

    RETURN CONCAT_WS(' ', first_name, last_name);
END;
$$;

SELECT fn_full_name('fred', 'sanford');
SELECT fn_full_name(NULL, 'SIMPSONS');
SELECT fn_full_name('JOHN', NULL);
SELECT fn_full_name(NULL, NULL);
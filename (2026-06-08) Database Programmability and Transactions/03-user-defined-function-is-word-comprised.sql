CREATE OR REPLACE FUNCTION fn_is_word_comprised (
    set_of_letters VARCHAR(50),
    word VARCHAR(50)
) RETURNS BOOLEAN
LANGUAGE plpgsql
AS
$$
DECLARE
    current_character CHAR(1);
BEGIN
    word = LOWER(word);
    set_of_letters = LOWER(set_of_letters);

    FOR i IN 1..LENGTH(word)
    LOOP
        current_character = SUBSTRING(word, i, 1);

        IF POSITION(current_character IN set_of_letters) = 0
        THEN RETURN FALSE;
        END IF;
    END LOOP;

    RETURN TRUE;
END;
$$;

SELECT fn_is_word_comprised('ois tmiah%f', 'halves');
SELECT fn_is_word_comprised('ois tmiah%f', 'Sofia');
SELECT fn_is_word_comprised('bobr', 'Rob');
SELECT fn_is_word_comprised('papopep', 'toe');
SELECT fn_is_word_comprised('R@o!B$B', 'Bob');
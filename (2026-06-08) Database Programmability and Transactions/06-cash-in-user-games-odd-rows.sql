CREATE OR REPLACE FUNCTION fn_cash_in_users_games (
    game_name VARCHAR(50)
) RETURNS TABLE (total_cash NUMERIC)
LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
    WITH ranked_cash_table
    AS (
        SELECT
            ug.cash,
            ROW_NUMBER() OVER (ORDER BY ug.cash DESC) AS row_number
        FROM users_games AS ug
        JOIN games AS g ON ug.game_id = g.id
        WHERE g.name = game_name
    )
    SELECT ROUND(SUM(ranked_cash_table.cash), 2) FROM ranked_cash_table
    WHERE ranked_cash_table.row_number % 2 != 0;
END;
$$;

SELECT fn_cash_in_users_games('Love in a mist');
SELECT fn_cash_in_users_games('Delphinium Pacific Giant');
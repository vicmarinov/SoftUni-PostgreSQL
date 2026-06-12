CREATE OR REPLACE FUNCTION fn_calculate_future_value (
    initial_sum DECIMAL,
    yearly_interest_rate DECIMAL,
    number_of_years INT
) RETURNS DECIMAL
LANGUAGE plpgsql
AS
$$
DECLARE
    yearly_multiplier DECIMAL;
    total_coefficient DECIMAL;
    future_value DECIMAL;
BEGIN
    yearly_multiplier = 1 + yearly_interest_rate;
    total_coefficient = yearly_multiplier ^ number_of_years;
    future_value = initial_sum * total_coefficient;

    RETURN TRUNC(future_value, 4);
END;
$$;

SELECT fn_calculate_future_value(1000, 0.1,  5 );
SELECT fn_calculate_future_value(2500, 0.30, 2 );
SELECT fn_calculate_future_value(500,  0.25, 10);
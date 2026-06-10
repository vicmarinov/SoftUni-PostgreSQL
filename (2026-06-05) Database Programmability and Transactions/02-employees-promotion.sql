CREATE PROCEDURE sp_increase_salaries(department_name VARCHAR)
LANGUAGE plpgsql
AS
$$
    DECLARE
        target_department_id INT;
    BEGIN
        target_department_id = (
            SELECT department_id FROM departments
            WHERE name = department_name
        );

        UPDATE employees AS e
        SET salary = salary * 1.05
        WHERE department_id = target_department_id;
    END;
$$;

CALL sp_increase_salaries('Finance');
CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
LANGUAGE plpgsql
AS
$$
    DECLARE
        is_employee_existing BOOLEAN;
    BEGIN
        is_employee_existing = EXISTS(
            SELECT * FROM employees
            WHERE employee_id = id
        );

        IF NOT is_employee_existing
        THEN
            RAISE NOTICE 'Employee with id % does not exist.', id;
            ROLLBACK;
            RETURN;
        END IF;

        UPDATE employees
        SET salary = salary * 1.05
        WHERE employee_id = id;

        COMMIT;
    END;
$$;

CALL sp_increase_salary_by_id(17);
CALL sp_increase_salary_by_id(9999999);
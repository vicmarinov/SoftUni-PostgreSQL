CREATE TABLE passports (
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 100) PRIMARY KEY,
    nationality VARCHAR(50) NOT NULL
);

INSERT INTO passports(nationality)
VALUES
    ('N34FG21B'),
    ('K65LO4R7'),
    ('ZE657QP2');

CREATE TABLE people (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2),
    passport_id INT REFERENCES passports(id) UNIQUE
);

INSERT INTO people(first_name, salary, passport_id)
VALUES
    ('Roberto', 43300.0000, 101),
    ('Tom',     56100.0000, 102),
    ('Yana',    60200.0000, 100);
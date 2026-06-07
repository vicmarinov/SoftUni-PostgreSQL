CREATE TABLE item_types (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_type_name VARCHAR(50) NOT NULL
);

CREATE TABLE items(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    item_type_id INT REFERENCES item_types(id)
);

CREATE TABLE cities (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    birthday DATE,
    city_id INT NOT NULL REFERENCES cities(id)
);

CREATE TABLE orders (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(id)
);

CREATE TABLE order_items (
    order_id INT NOT NULL REFERENCES orders(id),
    item_id INT NOT NULL REFERENCES items(id),
    PRIMARY KEY (order_id, item_id)
);
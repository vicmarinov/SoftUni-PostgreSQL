ALTER TABLE countries
ADD CONSTRAINT countries_continent_code_fkey
    FOREIGN KEY (continent_code)
    REFERENCES continents(continent_code)
    ON DELETE CASCADE,
ADD CONSTRAINT countries_currency_code_fkey
    FOREIGN KEY (currency_code)
    REFERENCES currencies(currency_code)
    ON DELETE CASCADE;
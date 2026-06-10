CREATE VIEW continent_currency_usage
AS SELECT
    currency_ranking_table.continent_code,
    currency_ranking_table.currency_code,
    currency_ranking_table.currency_usage
FROM (
    SELECT
        continent_code,
        currency_code,
        COUNT(*) AS currency_usage,
        DENSE_RANK() OVER (
            PARTITION BY continent_code
            ORDER BY COUNT(*) DESC
        ) currency_ranking_by_continent
    FROM countries
    GROUP BY continent_code, currency_code
    HAVING COUNT(*) > 1
) AS currency_ranking_table
WHERE currency_ranking_table.currency_ranking_by_continent = 1
ORDER BY currency_ranking_table.currency_usage DESC;
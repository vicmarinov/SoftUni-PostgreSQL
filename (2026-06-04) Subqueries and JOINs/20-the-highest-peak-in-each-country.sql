WITH peek_ranking_table AS
(
    SELECT
        c.country_name,
        m.mountain_range,
        p.peak_name,
        p.elevation,
        ROW_NUMBER() OVER (
            PARTITION BY c.country_name
            ORDER BY p.elevation DESC
        ) AS peek_ranking_by_country
    FROM countries AS c
    LEFT JOIN mountains_countries AS mc USING (country_code)
    LEFT JOIN peaks AS p USING (mountain_id)
    LEFT JOIN mountains AS m ON p.mountain_id = m.id
)
SELECT
    prt.country_name,
    COALESCE(prt.peak_name, '(no highest peak)') AS highest_peak_name,
    COALESCE(prt.elevation, 0) AS highest_peak_elevation,
    COALESCE(prt.mountain_range, '(no mountain)') AS mountain
FROM peek_ranking_table AS prt
WHERE prt.peek_ranking_by_country = 1
ORDER BY prt.country_name;
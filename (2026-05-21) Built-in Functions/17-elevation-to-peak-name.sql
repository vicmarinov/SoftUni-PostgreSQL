SELECT
    CONCAT_WS(
        ' ',
        elevation,
        CONCAT(REPEAT('-', 3), REPEAT('>', 2)), -- makes an arrow --->
        peak_name
    ) AS "Elevation --->> Peak Name"
FROM peaks
WHERE elevation >= 4884;
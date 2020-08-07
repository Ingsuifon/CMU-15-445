WITH total (nums) AS (
    SELECT COUNT(*) FROM titles
)
SELECT 
    CAST(premiered / 10 * 10 AS TEXT) || 's' decade,
    ROUND(CAST(COUNT(*) AS REAL) / nums * 100.0, 4) percent
FROM titles, total
WHERE premiered IS NOT NULL
GROUP BY decade
ORDER BY percent DESC, decade;
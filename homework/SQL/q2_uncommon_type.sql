WITH longest (tp, time) AS (
    SELECT type, MAX(runtime_minutes)
    FROM titles
    GROUP BY type
)
SELECT type, primary_title, runtime_minutes
FROM titles
JOIN longest
ON type = tp AND runtime_minutes = time
ORDER BY type, primary_title;
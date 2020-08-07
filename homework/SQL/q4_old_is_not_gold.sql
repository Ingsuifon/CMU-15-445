SELECT 
    CAST(premiered / 10 * 10 AS TEXT) || 's' decade,
    COUNT(title_id) nums
FROM titles
WHERE premiered IS NOT NULL
GROUP BY decade
ORDER BY nums DESC;
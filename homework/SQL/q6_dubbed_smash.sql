SELECT primary_title, temp.nums
FROM titles
JOIN
(SELECT title_id, COUNT(*) nums 
    FROM akas 
    GROUP BY title_id 
    ORDER BY nums DESC 
    LIMIT 10) temp
ON titles.title_id = temp.title_id;
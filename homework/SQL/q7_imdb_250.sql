WITH wav (weighted_average_rating) AS (
    SELECT SUM(rating * votes) / SUM(votes)
    FROM ratings
    JOIN titles
    ON  titles.type = 'movie' AND ratings.title_id = titles.title_id
),
mn (min_votes) AS(
    SELECT 25000.0
)
SELECT 
    primary_title,
    (votes / (votes + min_votes)) * rating + (min_votes / (votes + min_votes)) * weighted_average_rating AS war
FROM 
    ratings, wav, mn
JOIN
    titles
ON titles.type = 'movie' AND titles.title_id = ratings.title_id
ORDER BY war DESC
LIMIT 250;
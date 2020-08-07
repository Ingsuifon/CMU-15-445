WITH temp (id) AS (
    SELECT title_id 
    FROM crew 
    WHERE person_id IN (SELECT person_id FROM people WHERE name = 'Mark Hamill' AND born = 1951)
)
SELECT COUNT(DISTINCT(person_id)) FROM crew
JOIN temp ON title_id = id WHERE category IN ('actor', 'actress');
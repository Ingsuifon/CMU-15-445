SELECT primary_title FROM
titles
JOIN (
    SELECT a.title_id tt
    FROM 
    (SELECT title_id
    FROM crew
    JOIN people
    ON crew.person_id = people.person_id AND people.name = 'Mark Hamill' AND people.born = 1951) a
    JOIN
    (SELECT title_id
    FROM crew
    JOIN people
    ON crew.person_id = people.person_id AND people.name = 'George Lucas' AND people.born = 1944) b
    ON a.title_id = b.title_id
) c
ON title_id = tt AND type = 'movie' ORDER BY primary_title;
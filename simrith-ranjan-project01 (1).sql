#Question 3

%sql sqlite:////anvil/projects/tdm/data/movies_and_tv/imdb.db

%%sql

-- see information about a few TV episodes called "Finale"
SELECT *
FROM episodes AS e
INNER JOIN titles AS t
ON t.title_id = e.episode_title_id
WHERE t.primary_title = 'Finale'
LIMIT 5;

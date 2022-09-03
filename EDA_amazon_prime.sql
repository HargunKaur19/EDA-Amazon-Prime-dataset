SELECT * FROM amazonprime..ap_titles

-- Number of Movies and Series available on amazon prime

SELECT COUNT (CASE WHEN type = 'Movie' THEN 1 END) AS Num_of_movies,
       COUNT (CASE WHEN type = 'TV Show' THEN 1 END) AS Num_of_series
FROM amazonprime..ap_titles;

--Content released each year 

SELECT release_year, COUNT(title) AS Num_of_releases
FROM amazonprime..ap_titles
GROUP BY release_year
ORDER BY release_year DESC;

--List the top 10 oldest releases found on amazon prime

 SELECT TOP 10 title, release_year
 FROM amazonprime..ap_titles
 ORDER BY release_year; 


 -- Country wise number of tv shows and movies avaialable

 SELECT country, COUNT (type)
 FROM amazonprime..ap_titles
 GROUP BY country;

 --Number of Movies and shows under each rating type

 SELECT rating, COUNT(type) AS Num_of_movies_and_shows
 FROM amazonprime..ap_titles
 GROUP BY rating 
 ORDER BY Num_of_movies_and_shows DESC

 -- List the top 10 oldest TV Shows

 SELECT TOP 10 title, release_year
 FROM amazonprime..ap_titles
 WHERE type = 'TV Show'
 ORDER BY release_year; 

 -- Top 10 categories of content that were famous on amazon prime 

 SELECT top 10 listed_in, COUNT (type) AS Num_of_shows
 FROM amazonprime..ap_titles
 GROUP BY listed_in
 ORDER BY COUNT(type) DESC; 

 -- Top 10 longest movies with their release year

 SELECT TOP 10 title, duration, release_year
 FROM amazonprime..ap_titles
 ORDER BY duration DESC;

 -- Top 10 actors with maximum number of movies on amazon prime

SELECT cast, COUNT(title) as total_movies, RANK()
OVER (ORDER BY count(title) DESC) as rank_cast
from amazonprime..ap_titles
group by cast
having cast is not null
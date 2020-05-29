-- TUTORIAL

-- 1. 1962 movies
SELECT id, title
FROM movie
WHERE yr = 1962;

-- 2. When was Citizen Kane released?
SELECT yr
FROM movie
WHERE title = 'CItizen Kane';

-- 3. Star Trek movies
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4. id for actor Glenn Close
SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- 5. id for Casablanca
SELECT id
FROM movie
WHERE title = 'Casablanca';

-- 6. Cast list for Casablanca
SELECT actor.name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
WHERE casting.movieid = '11768';

-- 7. Alien cast list
SELECT actor.name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
WHERE casting.movieid =
  (SELECT id
  FROM movie
  WHERE title = 'Alien');

-- 8. Harrison Ford movies
SELECT movie.title
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
WHERE casting.actorid =
  (SELECT id
  FROM actor
  WHERE name = 'Harrison Ford');

-- 9. Harrison Ford as a supporting actor
SELECT movie.title
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
WHERE casting.actorid =
  (SELECT id
  FROM actor
  WHERE name = 'Harrison Ford')
AND casting.ord <> 1;

-- 10. Lead actors in 1962 movies
SELECT movie.title, actor.name
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON actor.id = casting.actorid
WHERE movie.yr = 1962 and casting.ord = 1;

-- 11. Busy years for Rock Hudson
SELECT movie.yr, COUNT(movie.title)
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON casting.actorid = actor.id
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(movie.title) > 2;

-- 12. Lead actor in Julie Andrews movies
SELECT movie.title, actor.name
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON actor.id = casting.actorid
WHERE movie.id IN
  (SELECT casting.movieid
  FROM casting
  WHERE casting.actorid =
    (SELECT id
    FROM actor
    WHERE name = 'Julie Andrews'))
AND casting.ord = 1;

-- 13. Actors with 15 leading roles
SELECT actor.name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.ord) >= 15
ORDER BY actor.name;

-- 14. Films released in the year 1978
SELECT movie.title, COUNT(casting.actorid) AS Cast_Count
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY Cast_Count DESC, movie.title;

-- 15. People who have worked with 'Art Garfunkel'.
SELECT actor.name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
WHERE casting.movieid IN
  (SELECT casting.movieid
  FROM casting
  WHERE casting.actorid =
    (SELECT actor.id
    FROM actor
    WHERE actor.name = 'Art Garfunkel'))
AND actor.name <> 'Art Garfunkel';


-- QUIZ
     
-- 1. List the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT name
FROM actor
INNER JOIN movie
ON actor.id = director
WHERE gross < budget;     
     
-- 2. Select correct example of JOINing three tables
SELECT *
FROM actor
INNER JOIN casting
ON actor.id = actorid
INNER JOIN movie
ON movie.id = movieid;     
     
-- 3. Show the list of actors called 'John' by order of number of movies in which they acted
SELECT name, COUNT(movieid)
FROM casting
INNER JOIN actor
ON actorid=actor.id
WHERE name LIKE 'John %'
GROUP BY name
ORDER BY 2 DESC;     
     
-- 5. List all the actors that starred in movies directed by Ridley Scott who has id 351
SELECT name
FROM movie
INNER JOIN casting
ON movie.id = movieid
INNER JOIN actor
ON actor.id = actorid
WHERE ord = 1 AND director = 351;     

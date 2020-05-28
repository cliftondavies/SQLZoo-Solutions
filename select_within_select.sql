-- TUTORIAL

-- 1. Bigger than Russia
SELECT name
FROM world
WHERE population >
(SELECT population
FROM world
WHERE name='Russia');

-- 2. Richer than UK
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp / population >
(SELECT gdp / population
FROM world
WHERE name = 'United Kingdom');

-- 3. Neighbours of Argentina and Australia
SELECT name, continent
FROM world
WHERE continent IN
(SELECT continent
FROM world
WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;
               
-- 4. Between Canada and Poland
SELECT name, population
FROM world
WHERE population >
(SELECT population
FROM world
WHERE name = 'Canada')
AND population <
(SELECT population
FROM world
WHERE name = 'Poland');
               
-- 5. Percentages of Germany
SELECT name, CONCAT(ROUND((population * 100) /
(SELECT population
FROM world
WHERE name = 'Germany')), '%') AS percentage
FROM world
WHERE continent = 'Europe';
               
-- 6. Bigger than every country in Europe
SELECT name
FROM world
WHERE gdp > ALL
(SELECT gdp
FROM world
WHERE continent = 'Europe' AND gdp > 0);
               
-- 7. Largest in each continent
SELECT continent, name, area
FROM world x
WHERE area >= ALL
(SELECT area
FROM world y
WHERE y.continent = x.continent AND area > 0);
               
-- 8. First country of each continent (alphabetically)
SELECT continent, name
FROM world x
WHERE name <= ALL
(SELECT name
FROM world y
WHERE y.continent = x.continent AND name IS NOT NULL);    
               

-- QUIZ
               
-- 1. Select name, region and population of the smallest country in each region
SELECT region, name, population
FROM bbc x
WHERE population <= ALL
(SELECT population
FROM bbc y
WHERE y.region = x.region AND population > 0);
               
-- 2. Select countries belonging to regions with all populations over 50000
SELECT name, region, population
FROM bbc x
WHERE 50000 < ALL
(SELECT population
FROM bbc y
WHERE x.region = y.region AND y.population > 0); 
               
-- 3. Select countries with a less than a third of the population of the countries around it
SELECT name, region
FROM bbc x
WHERE population < ALL
(SELECT population / 3
FROM bbc y
WHERE y.region = x.region AND y.name != x.name);
               
-- 5. Select countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name
FROM bbc
WHERE gdp >
(SELECT MAX(gdp)
FROM bbc
WHERE region = 'Africa');

-- 6. Select countries with population smaller than Russia but bigger than Denmark
SELECT name
FROM bbc
WHERE population <
(SELECT population
FROM bbc
WHERE name = 'Russia')
AND population >
(SELECT population
FROM bbc
WHERE name = 'Denmark');             

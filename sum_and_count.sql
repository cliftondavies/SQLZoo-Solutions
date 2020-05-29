-- TUTORIAL

-- 1. Total world population
SELECT SUM(population)
FROM world;

-- 2. List of continents
SELECT DISTINCT continent
FROM world;

-- 3. GDP of Africa
SELECT SUM(gdp) AS GDP_Of_Africa
FROM world
WHERE continent = 'Africa';

-- 4. Count the big countries
SELECT COUNT(*) AS Big_Countries
FROM world
WHERE area >= 1000000;

-- 5. Baltic states population
SELECT SUM(population) AS Baltics_Population
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. Counting the countries of each continent
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7. Counting big countries in each continent
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- 8. Counting big continents
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;


-- QUIZ

-- 1. Sum of population of all countries in 'Europe'
SELECT SUM(population)
FROM bbc
WHERE region = 'Europe';

-- 2. Number of countries with population smaller than 150000
SELECT COUNT(name)
FROM bbc
WHERE population < 150000;

-- 3. Average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population)
FROM bbc
WHERE name IN ('Poland', 'Germany', 'Denmark');

-- 6. Medium population density of each region
SELECT region, SUM(population) / SUM(area) AS density
FROM bbc
GROUP BY region;

-- 7. Name and population density of the country with the largest population
SELECT name, population / area AS density
FROM bbc
WHERE population =
  (SELECT MAX(population)
  FROM bbc);

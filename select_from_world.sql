-- TUTORIAL

-- 2. Large Countries
SELECT name
FROM world
WHERE population >= 200000000;

-- 3. Per capita GDP
SELECT name, gdp / population AS per_capita_GDP
FROM world
WHERE population >= 200000000;

-- 4. South America In millions
SELECT name, population / 1000000 AS population_in_millions
FROM world
WHERE continent = 'South America';

-- 5. France, Germany, Italy
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- 6. United
SELECT name
FROM world
WHERE name LIKE '%United%';

-- 7. Two ways to be big
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- 8. One or the other (but not both)
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

-- 9. Rounding
SELECT name, ROUND(population / 1000000, 2) AS population_in_millions, ROUND(gdp / 1000000000, 2) AS gdp_in_billions
FROM world
WHERE continent = 'South America';

-- 10. Trillion dollar economies
SELECT name, ROUND(gdp / population, -3) AS gdp_per_capita
FROM world
WHERE gdp >= 1000000000000;

-- 11. Name and capital have the same length
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

-- 12. Matching name and capital
SELECT name, capital
FROM world
WHERE name <> capital AND LEFT(name, 1) = LEFT(capital, 1);

-- 13. All the vowels
SELECT name
FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';


-- QUIZ

-- Q1
SELECT name
FROM world
WHERE name LIKE 'U%';

-- Q2
SELECT population
FROM world
WHERE name = 'United Kingdom';

-- Q5
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia');

-- Q6
SELECT name FROM world
WHERE name IN ('Cuba', 'Togo');

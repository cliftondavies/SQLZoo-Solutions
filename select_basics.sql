-- TUTORIAL

-- 1. Introducing the world table of countries
SELECT population
FROM world
WHERE name = 'Germany';
  
-- 2. Scandinavia
SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
  
-- 3. Just the right size
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000;


-- QUIZ

-- 1. Select countries with population between 1000000 and 1250000
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;

-- 3. Select countries that end in A or L
SELECT name
FROM world
WHERE name LIKE '%a' OR name LIKE '%l';

-- 6. Select countries with an area larger than 50000 and a population smaller than 10000000
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;

-- 7.  Select the population density of China, Australia, Nigeria and France
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

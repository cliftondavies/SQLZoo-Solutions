-- TUTORIAL

-- 1. Population of Germany
SELECT population
FROM world
WHERE name = 'Germany';
  
-- 2. Population of Scandinavia countries
SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
  
-- 3. Countries between 200000 and 250000 square kilometers
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000;


-- QUIZ

-- 1. Countries with population between 1000000 and 1250000
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;

-- 3. Countries that end in A or L
SELECT name
FROM world
WHERE name LIKE '%a' OR name LIKE '%l';

-- 6. Countries with an area larger than 50000 and a population smaller than 10000000
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;

-- 7.  Population density of China, Australia, Nigeria and France
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

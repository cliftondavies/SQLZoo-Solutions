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

-- Q1
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;

-- Q3
SELECT name
FROM world
WHERE name LIKE '%a' OR name LIKE '%l';

-- Q6
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;

-- Q7
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

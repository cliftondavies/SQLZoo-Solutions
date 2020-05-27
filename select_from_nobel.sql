-- TUTORIAL

-- 1. Winners for 1950
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- 2. 1962 Literature
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature';

-- 3. Albert Einstein
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4. Recent Peace Prizes
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

-- 5. Literature in the 1980's
SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Only Presidents
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- 7. John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

--8. Chemistry and Physics from different years
SELECT *
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

-- 9. Exclude Chemists and Medics
SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

-- 10. Early Medicine, Late Literature
SELECT *
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

-- 11. Umlaut
SELECT *
FROM nobel
WHERE winner LIKE 'PETER GR%';

-- 12. Apostrophe
SELECT *
FROM nobel
WHERE winner = "Eugene O'neill";

-- 13. Knights of the realm
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

-- 14. Chemistry and Physics last
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY
CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1
ELSE 0
END, subject, winner;


-- QUIZ

-- Q1
SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n';
 
-- Q2
SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 and 1960;

-- Q3
SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');

-- Q5
SELECT yr FROM nobel
WHERE yr NOT IN
(SELECT yr
FROM nobel
WHERE subject IN ('Chemistry', 'Physics'));

-- Q6
SELECT DISTINCT yr
FROM nobel
WHERE subject = 'Medicine' AND yr NOT IN
(SELECT yr FROM nobel 
WHERE subject = 'Literature')
AND yr NOT IN (SELECT yr FROM nobel
WHERE subject = 'Peace');

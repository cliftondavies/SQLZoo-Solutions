-- TUTORIAL

-- 1. How many stops are in the database.
SELECT COUNT(id)
FROM stops;

-- 2. id value for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

-- 3. id and the name for the stops on the '4' 'LRT' service.
SELECT id, name
FROM stops
INNER JOIN route
ON stops.id = route.stop
WHERE route.num = '4' AND route.company = 'LRT';

-- 4. Number of routes that visit either London Road (149) or Craiglockhart (53).
SELECT company, num, COUNT(*)
FROM route
WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5. Services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a
INNER JOIN route b
ON a.company = b.company AND a.num = b.num
WHERE a.stop = 53 AND b.stop = 149;

-- 6. Services between 'Craiglockhart' and 'London Road'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a
INNER JOIN route b
ON a.company = b.company AND a.num = b.num
INNER JOIN stops stopa
ON a.stop = stopa.id
INNER JOIN stops stopb
ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';

-- 7. List of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, b.num
FROM route a
INNER JOIN route b
ON a.company = b.company AND a.num = b.num
WHERE a.stop = 115 AND b.stop = 137;

-- 8. List of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route a
INNER JOIN route b
ON a.company = b.company AND a.num = b.num
INNER JOIN stops stopa
ON a.stop = stopa.id
INNER JOIN stops stopb
ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

-- 9. Distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus,
-- including 'Craiglockhart' itself, offered by the LRT company.
SELECT stops.name, a.company, a.num
FROM route a
INNER JOIN route b
ON a.company = b.company AND a.num = b.num
INNER JOIN stops
ON b.stop = stops.id
WHERE a.stop = 53 AND a.company = 'LRT';

-- 10. Yet to be solved


-- QUIZ

-- 1. Select the code that would show it is possible to get from Craiglockhart to Haymarket
SELECT DISTINCT a.name, b.name
FROM stops a
INNER JOIN route z
ON a.id = z.stop
INNER JOIN route y
ON y.num = z.num
INNER JOIN stops b
ON y.stop = b.id
WHERE a.name = 'Craiglockhart' AND b.name = 'Haymarket';

-- 2. Stops that are on route.num '2A' which can be reached with one bus from Haymarket
SELECT S2.id, S2.name, R2.company, R2.num
FROM stops S1, stops S2, route R1, route R2
WHERE S1.name = 'Haymarket' AND S1.id = R1.stop AND R1.company = R2.company AND R1.num = R2.num AND R2.stop=S2.id AND R2.num='2A';

-- 3. Services available from Tollcross
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a
INNER JOIN route b
ON a.company = b.company AND a.num=b.num
INNER JOIN stops stopa
ON a.stop = stopa.id
INNER JOIN stops stopb
ON b.stop = stopb.id
WHERE stopa.name = 'Tollcross';

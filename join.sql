-- TUTORIAL

-- 1. show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for just game 1012
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;

-- 3. Show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game
INNER JOIN goal
ON id = matchid
WHERE teamid = 'GER';

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM game
INNER JOIN goal
ON id = matchid
WHERE player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
FROM goal
INNER JOIN eteam
ON teamid = id
WHERE gtime <= 10;

-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname
FROM game
INNER JOIN eteam
ON game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos';

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT goal.player
FROM goal
INNER JOIN game
ON goal.matchid = game.id
WHERE game.stadium = 'National Stadium, Warsaw';

-- 8. Show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
FROM game
INNER JOIN goal
ON matchid = id 
WHERE team1 IN ('GER', teamid) AND team2 IN ('GER', teamid);

-- 9. Show teamname and the total number of goals scored.
SELECT eteam.teamname, COUNT(goal.teamid) AS Goals_Scored
FROM eteam
JOIN goal
ON eteam.id = goal.teamid
GROUP BY goal.teamid
ORDER BY eteam.teamname;

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT game.stadium, COUNT(game.stadium) AS Stadium_Goals
FROM game
JOIN goal
ON game.id = goal.matchid
GROUP BY game.stadium;

-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT goal.matchid, game.mdate, COUNT(goal.player) AS Match_Goals
FROM game
INNER JOIN goal
ON goal.matchid = id 
WHERE game.team1 = 'POL' OR game.team2 = 'POL'
GROUP BY goal.matchid;

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT goal.matchid, game.mdate, COUNT(goal.teamid)
FROM goal
INNER JOIN game
ON game.id = goal.matchid
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid;

-- 13. List every match with the goals scored by each team (Incomplete)
SELECT game.mdate, game.team1,
SUM(CASE WHEN goal.teamid = game.team1 THEN 1
ELSE 0
END) AS score1, game.team2,
SUM(CASE WHEN goal.teamid = game.team2 THEN 1
ELSE 0
END) AS score2
FROM game
INNER JOIN goal
ON goal.matchid = game.id
GROUP BY game.id
ORDER BY game.mdate, goal.matchid, game.team1, game.team2;


-- QUIZ

-- 3. Select players, their team and the amount of goals they scored against Greece(GRE).
SELECT player, teamid, COUNT(*)
FROM game
JOIN goal
ON matchid = id
WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE'
GROUP BY player, teamid;

-- 5. Select the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
SELECT DISTINCT player, teamid 
FROM game
JOIN goal
ON matchid = id 
WHERE stadium = 'National Stadium, Warsaw' 
AND (team1 = 'POL' OR team2 = 'POL') AND teamid != 'POL';

-- 6. Select the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw)
-- but not against Italy(ITA).
SELECT DISTINCT player, teamid, gtime
FROM game 
JOIN goal 
ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)' AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'));

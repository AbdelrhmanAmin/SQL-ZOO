-- 1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';
-- 2
SELECT id,stadium,team1,team2
  FROM game
where id= 1012;
-- 3
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
where teamid = 'GER';
-- 4
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
where player LIKE 'Mario%';
-- 5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on (teamid=id)
 WHERE gtime<=10;
-- 6
select mdate, teamname from game
Join eteam ON(team1=eteam.id)
where eteam.coach = 'Fernando Santos';
-- 7
SELECT player
  FROM game JOIN goal ON (matchid=id)
where stadium = 'National Stadium, Warsaw';
-- 8
SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER')
AND teamid!='GER';
-- 9
SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname;
--  10
select stadium, count(player)
 from game JOIN goal on (id=matchid)
group by stadium;
-- 11
SELECT matchid,mdate, count(player)
  FROM game JOIN goal ON (matchid = id) 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid,mdate;
-- 12
select matchid, mdate, count(player)
from game join goal on (matchid=id)
where (team1='GER' OR team2='GER')
AND teamid ='GER'
group by matchid, mdate;
-- 13
SELECT mdate,team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game 
JOIN goal ON matchid = id
group by mdate,matchid,team1,team2
ORDER by mdate,matchid,team1,team2;
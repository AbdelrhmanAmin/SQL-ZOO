-- 1
SELECT COUNT(*) from stops;
-- 2
SELECT id from stops WHERE name = 'Craiglockhart';
-- 3
SELECT id, name FROM stops 
JOIN route on id=stop
WHERE num = '4' AND company= 'LRT';
-- 4
SELECT company, num, COUNT(*) AS x
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING x = 2;
-- 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
AND b.stop = 149;
-- 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';
-- 7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE a.stop = 115 AND b.stop =137;
-- 8
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';
-- 9
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name = 'Craiglockhart'  AND a.company = 'LRT';
-- 10
SELECT  a.num, a.company, a.name, b.num, b.company
FROM (SELECT DISTINCT x.num, x.company, stopy.name 
 FROM route x JOIN route y 
   ON (x.num = y.num AND x.company = y.company) 
 JOIN stops AS stopx ON stopx.id = x.stop 
 JOIN stops AS stopy ON stopy.id = y.stop 
 WHERE stopx.name ='Craiglockhart' AND stopy.name !=
 'Craiglockhart')a
JOIN (SELECT  a.num, a.company, stopb.name 
 FROM route a JOIN route b 
   ON (a.num = b.num AND a.company = b.company) 
 JOIN stops AS stopa ON stopa.id = a.stop 
 JOIN stops AS stopb ON stopb.id = b.stop 
 WHERE stopa.name ='Lochend' AND stopb.name !='Lochend')b
ON (a.name=b.name)
ORDER BY a.num, a.name, b.num;
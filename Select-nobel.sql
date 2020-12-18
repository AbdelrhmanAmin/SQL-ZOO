-- 1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;
 --2
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';
-- 3
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein';
-- 4
SELECT winner
  FROM nobel
 WHERE yr >= 2000 AND subject = 'Peace';
-- 5
select yr, subject, winner
from nobel
where subject = 'Literature' AND yr BETWEEN 1980 AND 1989;
-- 6
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');
-- 7
select winner
from nobel
where winner LIKE 'John%';
-- 8
select yr, subject, winner
from nobel
where (subject = 'Physics' AND yr = 1980)
or (subject = 'Chemistry' AND yr = 1984);
-- 9
select yr, subject, winner
from nobel
where yr = 1980 AND (subject != 'Medicine' AND subject !='Chemistry');
--  10
select yr, subject, winner
from nobel
WHERE (subject = 'Medicine' AND yr < 1910) or
( subject = 'Literature' AND yr >= 2004);
-- 11
select * from nobel
where winner = 'PETER GRÜNBERG';
-- 12
select * from nobel
where winner = 'EUGENE O''NEILL';
-- 13
select winner, yr, subject from nobel
where winner LIKE 'Sir%'
-- 14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY  subject IN ('Physics','Chemistry'),subject,winner
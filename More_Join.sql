-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962;
-- 2
select yr from movie
where title = 'Citizen Kane';
-- 3
select id, title, yr from movie
Where title LIKE '%Star Trek%'
ORDER BY yr;
-- 4
select id from actor
where name = 'Glenn Close';
-- 5
select id from movie
where title = 'Casablanca';
-- 6
select name from actor
join casting on actorid=id
where movieid=11768;
-- 7
select name from actor
join casting on id=actorid
where movieid = (select id from movie
where title='Alien')
-- 8
select title from movie
join casting on movieid=id
where actorid = (select id from actor
where name ='Harrison Ford');
-- 9
select title from movie
join casting on movieid=id
where actorid = (select id from actor
where name ='Harrison Ford') AND ord > 1;
-- 10
SELECT title, name FROM 
(actor JOIN casting ON actorid=id)
 JOIN movie ON movie.id=movieid 
WHERE yr = 1962 AND ord = 1;
-- 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
-- 12
SELECT title, name 
FROM movie 
JOIN casting ON (movie.id = movieid AND ord=1)
JOIN actor ON actorid=actor.id
WHERE movie.id IN (SELECT movieid from casting
WHERE actorid IN (SELECT id FROM actor WHERE name='Julie Andrews'));
-- 13
SELECT name FROM actor
JOIN casting ON (actor.id=actorid)
WHERE ord = 1
GROUP BY name
HAVING COUNT(ord) >= 15;
-- 14
SELECT title,
COUNT(actorid) as NUM FROM movie
JOIN casting on (movie.id=movieid)
where yr = 1978
GROUP BY title
ORDER BY NUM DESC,title;
-- 15
SELECT DISTINCT name from actor
WHERE name != 'Art Garfunkel' AND actor.id in (SELECT actorid from casting
WHERE movieid IN (SELECT movieid FROM casting
JOIN actor ON actor.id=actorid
WHERE actorid = (SELECT id from actor
WHERE name = 'Art Garfunkel')));
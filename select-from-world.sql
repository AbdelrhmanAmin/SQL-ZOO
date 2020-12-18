-- 1
SELECT name, continent, population FROM world;

-- 2
SELECT name FROM world
WHERE population >= 200000000;
-- 3
Select name, gdp/population
from world
WHERE population >= 200000000;
-- 4
select name, population/1000000
from world
where continent = 'South America';
-- 5
select name, population
from world
where name in ('France', 'Germany', 'Italy');
-- 6
select name
from world
where name LIKE '%United%';
-- 7
select name, population, area
from world
where area > 3000000 OR population > 250000000;
-- 8
select name, population, area
from world
where area > 3000000 XOR population > 250000000;
-- 9
select name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
from world
where continent = 'South America';
-- 10
select name, ROUND(gdp/population, -3)
from world
where gdp >= 1000000000000;
-- 11
Select name, capital
from world
where Length(name) = Length(capital);
-- 12
select name, capital
from world
where LEFT(name,1) = LEFT(capital,1) AND name != capital;
-- 13
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'
  AND name NOT LIKE '% %';
-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');
-- 2
SELECT name FROM world
  WHERE continent ='Europe' AND gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom');
-- 3
select name, continent from world
Where continent IN (select continent from world
where name = 'Argentina' or name = 'Australia')
order by name;
-- 4
select name from world
where population > (Select population from world where name = 'Canada') 
AND population < (Select population from world where name = 'Poland');
-- 5
select name, CONCAT(ROUND(population/(select population from world where name = 'Germany')*100), '%') from world
where continent = 'Europe';
-- 6
select name from world
where gdp > (select gdp from world where gdp > 0 AND continent ='Europe')
-- 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent
          AND population>0);
-- 8
SELECT continent ,name FROM world x
Where name <= ALL (SELECT name from world y where x.continent = y.continent);
-- 9
select name, continent, population from world 
where continent IN(select continent from world x where 25000000 >= (select MAX(population) from world y where x.continent =y.continent ))
-- 10
select name, continent from world x
where population > ALL(Select 3*population from world y where x.continent = y.continent AND x.name != y.name);
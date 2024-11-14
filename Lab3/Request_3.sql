SELECT CONCAT(name, ' (', region, ')') AS city_region 
FROM cities 
WHERE population > 100000 
ORDER BY name;

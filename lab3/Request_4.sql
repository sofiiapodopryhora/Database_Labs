SELECT name, population, population/400000 AS percent
FROM cities
ORDER BY population DESC
LIMIT 10;

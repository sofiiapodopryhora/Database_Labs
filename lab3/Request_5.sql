SELECT Concat(name, '-', population/400000 , '%') AS percent
FROM cities
WHERE (population / 400000) >= 0.1
ORDER BY (population / 400000) DESC;

SELECT name, UPPER(name) AS name_upcase
FROM cities ORDER BY name
LIMIT 5 OFFSET 5;

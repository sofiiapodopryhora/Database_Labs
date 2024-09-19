SELECT name
from cities
WHERE NOT region IN ('E', 'W')
ORDER BY population DESC
LIMIT 10 OFFSET 10;

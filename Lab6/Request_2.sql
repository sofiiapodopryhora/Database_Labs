select cities.name as city_name, regions.name as region_name
from cities
join regions on cities.region = regions.uuid
where regions.name = 'Nord';

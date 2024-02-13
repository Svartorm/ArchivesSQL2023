select id, first_name, last_name
from people
where exists (
    select * 
    from transport.metro_usage_logs
    join transport.metro_stations on metro_stations.id = metro_usage_logs.station_id
    where name = 'Morgane Abeille' and people.id = metro_usage_logs.person_id
);
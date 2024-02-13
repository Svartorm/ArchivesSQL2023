select *
from (
    select 
        people.id as person_id,
        people.first_name as person_first_name,
        people.last_name as person_last_name,
        created_at,
        'metro' as place,
        metro_usage_logs.station_id as place_id
    from transport.metro_usage_logs
    join people on people.id = metro_usage_logs.person_id

    union

    select 
        people.id as person_id,
        people.first_name as person_first_name,
        people.last_name as person_last_name,
        created_at,
        'street' as place,
        street_logs.street_id as place_id
    from street_logs
    join people on people.id = street_logs.person_id

    union

    select 
        people.id as person_id,
        people.first_name as person_first_name,
        people.last_name as person_last_name,
        created_at,
        'shop' as place,
        shop_entrance_logs.shop_id as place_id
    from shop_entrance_logs
    join people on people.id = shop_entrance_logs.person_id
) as data
where created_at between '2059-12-03 17:00' and '2059-12-03 22:00'
order by created_at, person_id;

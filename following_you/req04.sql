select * from
(
select 'metro' as place_type, count(*) as entries, station_id as place_id
from transport.metro_usage_logs
group by station_id

union

select 'shop' as place_type, count(*) filter (where transit_type = 'ENTER') as entries, shop_id as place_id
from shop_entrance_logs
group by shop_id
) as data
order by entries desc, place_id, place_type desc;

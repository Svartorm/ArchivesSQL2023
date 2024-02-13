with dc as (
    select
        data_center_id as id,
        count(*) as nb_server,
        sum(core_count) as core,
        sum(ram) as ram,
        sum(storage) as storage
    from memorin.server_hierarchy
    group by data_center_id
    order by data_center_id
)
select
    name as zone_name,
    count(*) as data_center_count,
    sum(nb_server) as total_servers,
    sum(core) as total_cores,
    sum(dc.ram) as total_ram,
    sum(dc.storage) as total_storage
from dc
join memorin.server_hierarchy as sh on sh.data_center_id = dc.id
join memorin.geographic_zones as geo on geo.id = sh.zone_id
group by name;

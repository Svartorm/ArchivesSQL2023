drop view if exists memorin.server_hierarchy;

create recursive view memorin.server_hierarchy(id, zone_id, core_count, ram, storage, data_center_id) as 
select 
    id,
    zone_id,
    core_count,
    ram,
    storage,
    id as data_center_id
from memorin.servers
where master_id is null

union all 

select 
    server.id,
    server.zone_id,
    server.core_count,
    server.ram,
    server.storage,
    rec.data_center_id
    
from memorin.servers as server
join server_hierarchy as rec on rec.id = server.master_id; 

select * from memorin.server_hierarchy
order by data_center_id;

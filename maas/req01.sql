-- drop view memorin.devices_summary;

create view memorin.devices_summary as
select 
    count(*) as total_devices,
    count(*) filter (where deactivated_at is null) as active_devices,
    count(*) filter (where not deactivated_at is null) as inactive_devices
from memorin.devices;

-- select * from memorin.devices_summary;

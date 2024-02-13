drop view if exists memorin.zoned_devices_logs;

create view memorin.zoned_devices_logs as 
select 
    device_serial,
    version_id,
    zone_id,
    latitude as lat,
    longitude as long,
    temperature as temp,
    battery_percentage as battery,
    signal_strength

from memorin.device_logs as log
where device_serial in (
        select serial_number
        from memorin.devices
        where deactivated_at is null
    )
    and version_id in (
        select id 
        from memorin.device_versions
    )
    and temperature between 34 and 45
    and signal_strength between 0 and 5
    and battery_percentage between 0 and 100
    and exists (
        select * 
        from memorin.geographic_zones as zone
        where zone.id = log.zone_id
            and latitude between min_latitude and max_latitude
            and longitude between min_longitude and max_longitude
    )
    with check option;

select * from memorin.zoned_devices_logs;

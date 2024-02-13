create temporary view devices_metrics as 
select 
    device_serial,
    version_id,
    log.id as log_id,
    latitude as lat,
    longitude as long,
    temperature as temp,
    battery_percentage as battery,
    signal_strength

from memorin.device_logs as log
join memorin.device_versions as v on v.id = log.version_id
where device_serial in (
    select serial_number
    from memorin.devices
    where deactivated_at is null
)
order by device_serial collate "C", v.created_at desc, log_id;

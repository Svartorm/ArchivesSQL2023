drop materialized view if exists memorin.outdated_devices;

create materialized view memorin.outdated_devices as 
select 
    serial_number,
    version_id,
    released_at,
    eol_timestamp,
    versions_behind

from (
    select 
        serial_number,
        version_id,
        released_at,
        eol_timestamp,
        (select 
            count(*) filter (where nv.released_at > v.released_at)
        from memorin.device_versions as nv) as versions_behind,

        deactivated_at

    from memorin.devices as device
    join memorin.device_versions as v on v.id = device.version_id
) as data
where eol_timestamp is not null
    and deactivated_at is null;

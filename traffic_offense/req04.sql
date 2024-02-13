select traffic.id, traffic.description, traffic.violation_date, traffic.street_id, traffic.license_plate
from public.traffic_violations as traffic, (
    select * 
    from public.traffic_violations
    where license_plate like 'AZ__36_'
        and violation_date >= timestamp '2059-12-03 21:00' - interval '1 hours'
        and violation_date <= timestamp '2059-12-03 21:00' + interval '1 hours'
        and (
            description = 'SPEED_AND_TRAFFIC_VIOLATION'
            or description = 'RECKLESS_AND_DANGEROUS_DRIVING'
        )
) as suspect

where traffic.license_plate = suspect.license_plate;

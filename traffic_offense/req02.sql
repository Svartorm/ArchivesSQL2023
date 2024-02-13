select * 
from public.traffic_violations
where license_plate like 'AZ__36_'
    and violation_date >= timestamp '2059-12-03 21:00' - interval '1 hours'
    and violation_date <= timestamp '2059-12-03 21:00' + interval '1 hours';


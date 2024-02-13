select *
from memorin.outdated_devices
order by versions_behind desc, serial_number;

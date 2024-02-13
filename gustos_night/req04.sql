select id, reservation_name, reservation_date
from gusto_reservations
where reservation_date >= '2059-12-03 18:00:00'
    and reservation_date <= '2059-12-03 21:00:00'
    and not cancelled;

select gusto_guests.id, reservation_id
from gusto_reservations, gusto_guests
where reservation_date >= '2059-12-03 18:00:00'
    and reservation_date <= '2059-12-03 21:00:00'
    and not cancelled
    and reservation_id = gusto_reservations.id;

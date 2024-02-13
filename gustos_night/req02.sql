select reservation_name, reservation_date, bill_total, table_id
from gusto_reservations
where reservation_name != 'Whitman';

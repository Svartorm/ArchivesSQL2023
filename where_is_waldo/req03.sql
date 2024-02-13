select 
    shift.id as id,
    checkout_id,
    employee_id,
    shift.store_id as shift_store_id,
    checkout.store_id as checkout_store_id,
    start_timestamp,
    end_timestamp

from nexus_stores.cashier_shifts as shift
join nexus_stores.checkouts as checkout on checkout.id = shift.checkout_id;

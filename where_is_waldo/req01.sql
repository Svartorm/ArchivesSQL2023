create table dtf.shifts_and_sales_78 as
select
    sale.id as sales_id,
    product_id,
    sale.checkout_id,
    sale_timestamp,
    shift.id as shift_id,
    employee_id,
    start_timestamp as shift_start_timestamp,
    end_timestamp as shift_end_timestamp

from nexus_stores.sales as sale
join nexus_stores.cashier_shifts as shift on sale.checkout_id = shift.checkout_id 
where sale.store_id = 78 
    and start_timestamp = '2059-12-01 13:00'
    and sale_timestamp between '2059-12-01 13:00' and '2059-12-01 15:00';

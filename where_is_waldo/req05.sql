select emp.id as employee_id, person_id, first_name, last_name
from nexus_stores.employees as emp
join people on emp.person_id = people.id
where store_id = 78
    and position = 'CASHIER'
    and emp.id not in (
    select employee_id
    from nexus_stores.cashier_shifts
    where start_timestamp = '2059-12-01 13:00'
        and store_id = 78
    group by employee_id
);

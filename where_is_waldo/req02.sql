select 
    tt - pre_emp as null_employee_id_rows_count,
    tt - pre_store as null_store_id_rows_count
from (
    select count(*) as tt
    from nexus_stores.cashier_shifts
) as total,
(
    select count(*) as pre_store
    from nexus_stores.cashier_shifts as s1
    inner join nexus_stores.cashier_shifts as s2 on s1.store_id = s2.store_id
                                            and s1.id = s2.id                                  
) as present,
(
select count(*) as pre_emp
    from nexus_stores.cashier_shifts as s1
    inner join nexus_stores.cashier_shifts as s2 on s1.employee_id = s2.employee_id 
                                            and s1.id = s2.id
) as ehfge;

insert into scrooge_eats_orders (id, account_id, ordered_at, total_price)
select 10000, scrooge_eats_accounts.id, now(), 0
from scrooge_eats_accounts, (
    select id
    from companies
    where name = 'DTF'
) as dtf
where company_id = dtf.id

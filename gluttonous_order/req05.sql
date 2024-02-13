insert into scrooge_eats_orders (id, account_id, ordered_at, total_price)
select 10001, scrooge_eats_accounts.id, now(), 11.70
from scrooge_eats_accounts, (
    select id
    from companies
    where name = 'DTF'
) as dtf
where company_id = dtf.id;

insert into scrooge_eats_basket_items (order_id, item_id, quantity)
select 10001, id, 1
from scrooge_eats_items
where name = 'Margherita pizza'
    or name = 'Coca-Cola';

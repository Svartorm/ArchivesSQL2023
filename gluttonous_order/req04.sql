insert into scrooge_eats_basket_items (order_id, item_id, quantity)
select 10000, id, 1
from scrooge_eats_items
where name = 'Kinder Bueno White'
    or name = 'Tacos'
    or name = 'Coca-Cola';

insert into scrooge_eats_reviews (account_id,order_id,rating,review)
select account_id, 10001, 3, 'Let me go home'
from scrooge_eats_orders
where id = 10001
limit 1;

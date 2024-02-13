insert into scrooge_eats_reviews (account_id, rating, review)
select id, 3, 'I still want to go home'
from (
    select acc.id
    from scrooge_eats_accounts as acc, companies as cmp
    where cmp.id = company_id
    limit 1
)as acc;

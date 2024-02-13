select scrooge_eats_accounts.id
from scrooge_eats_accounts, (
    select id
    from companies
    where name = 'DTF'
) as dtf
where company_id = dtf.id;

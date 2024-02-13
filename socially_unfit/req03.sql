select first_name, last_name, death_date, social_credit_balance
from public.people
where not death_date is null
order by death_date desc, social_credit_balance desc
limit 100;

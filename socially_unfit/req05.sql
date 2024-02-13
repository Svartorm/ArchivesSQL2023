select id, person_id, credits_change, action_description
from public.social_credit_history
where date >= '2059-12-03 17:00'
    and date <= '2059-12-03 22:00'
order by credits_change, id
limit 10;

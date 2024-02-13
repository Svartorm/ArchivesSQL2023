select first_name, last_name, birth_date, job_id, social_credit_balance
from public.people
where death_date is null 
    and not job_id is null
    and social_credit_balance > 0
order by social_credit_balance desc, birth_date, job_id
limit 100 offset 200;

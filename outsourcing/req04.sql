create table release_dates as
select person_id, 
    first_name, 
    last_name, 
    outcome.created_at,
    serving_time,
    case 
    when amount is null 
        then outcome.created_at + serving_time * interval '1 month'
    else outcome.created_at + serving_time * interval '1 month' - amount * interval '1 month'
    end as release_date

from justice.outcomes as outcome
join justice.defendants as def on def.trial_id = outcome.trial_id
join people on def.person_id = people.id
left outer join justice.sentence_reductions as reduc on reduc.outcome_id = outcome.id

where outcome = 'GUILTY'

order by release_date desc, serving_time desc;

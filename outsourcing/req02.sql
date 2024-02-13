create table outcome_status as
select person_id, 
    first_name, 
    last_name, 
    birth_date,
    outcome.created_at as conviction_date, 
    serving_time,
    case
    when outcome.created_at + serving_time * interval '1 month' < '2059-12-03'
        then 't'
    else 'f'
    end as could_be_released

from justice.outcomes as outcome
join justice.trials as trial on trial.id = trial_id
join justice.defendants as def on def.trial_id = outcome.trial_id
join people on def.person_id = people.id
join justice.cases as cs on cs.id = trial.case_id

where classification = 'CRIME'
    and outcome = 'GUILTY';

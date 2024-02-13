create temporary table not_guilty as
select person_id, first_name, last_name, birth_date, classification, description

from justice.outcomes as outcome 
join justice.defendants as def on def.trial_id = outcome.trial_id
join justice.trials as trial on trial.id = def.trial_id
join justice.cases as cs on cs.id = trial.case_id
join people on def.person_id = people.id

where outcome = 'NOT_GUILTY';

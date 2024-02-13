create table definitive_trials as
select trial.id as trial_id, case_id, classification, description
from justice.cases as cs, justice.trials as trial
where case_id = cs.id
    and trial.status = 'FINISHED'
order by classification, case_id;

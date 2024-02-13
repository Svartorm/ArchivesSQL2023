select person_id, case_id as id, content, description
from justice.testimonies, justice.cases
where content like '%Nexus N3%'
    and ( description like '%speeding%'
    or description like '%speed%'
    or description like '%fast%'
    or description like '%reckless%')
    and justice.cases.id = case_id;

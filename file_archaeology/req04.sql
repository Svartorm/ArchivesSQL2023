select *
from (
    select 
        parent_id as folder_id,
        count(*) filter (where permissions ilike '%x%') as nb_executables
    from dtf.madelines_files
    group by parent_id
    order by parent_id nulls first
) as res
where nb_executables >= 3;

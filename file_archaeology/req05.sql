select mf.owner, mf.num_files
from (
    select min(nb) as min
    from (
        select count(*) as nb
        from dtf.madelines_files
        group by owner
    ) as file
) as num,
(
    select 
        owner,
        count(*) as num_files
    from dtf.madelines_files
    group by owner
    order by owner
) as mf

where mf.num_files = num.min;


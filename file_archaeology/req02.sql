select filename, f.size
from dtf.madelines_files as f, (
    select max(size) filter (where created_at between '2059-11-27' and '2059-12-03') as size
    from dtf.madelines_files
) as max
where f.size = max.size
    and created_at between '2059-11-27' and '2059-12-03' 
order by filename;

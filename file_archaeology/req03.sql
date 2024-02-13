select filename, size
from dtf.madelines_files, (
    select (avg(size) * 0.75) as avg
    from dtf.madelines_files
) as percent
where size > percent.avg
order by size desc;

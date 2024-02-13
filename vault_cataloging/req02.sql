select 
    id,
    size as stored_size,
    decrypted,

    case
    when size is null and decrypted 
        then avg_decryp::bigint
    when size is null and not decrypted
        then avg_encryp::bigint
    else
        size::bigint
    end as calculated_size

from dtf.madelines_files_results, (
    select 
        avg(size) filter (where decrypted) as avg_decryp,
        avg(size) filter (where not decrypted) as avg_encryp
    from dtf.madelines_files_results
    where not parent_id is null
) as avgs
where not parent_id is null
order by id;

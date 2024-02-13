select id, filename, 
    case 
    when decrypted then 'File was successfully decrypted.'
    when parent_id in (
        select id
        from dtf.madelines_files_results
        where decrypted
    ) then 'File was successfully decrypted because its containing folder was successfully decrypted.'
    else 'File remains encrypted.'
    end as decryption_status

from dtf.madelines_files_results
order by id;

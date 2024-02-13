insert into dtf.madelines_contacts (id, title, first_name, last_name, phone, email, favorite, created_at)
select 
    id,

    case
    when split_part (
        upper (
            regexp_replace(
                regexp_replace(full_name, '[^[:ascii:]]', '', 'g'), 
                '[0-9]', '', 'g')
        ),
        ' ', '1') = 'MRS'
    then 'MRS'::prefix
    when split_part (
        upper (
            regexp_replace(
                regexp_replace(full_name, '[^[:ascii:]]', '', 'g'), 
                '[0-9]', '', 'g')
        ),
        ' ', '1') = 'MR'
    then 'MR'::prefix
    when split_part (
        upper (
            regexp_replace(
                regexp_replace(full_name, '[^[:ascii:]]', '', 'g'), 
                '[0-9]', '', 'g')
        ),
        ' ', '1') = 'MS'
    then 'MS'::prefix
    when split_part (
        upper (
            regexp_replace(
                regexp_replace(full_name, '[^[:ascii:]]', '', 'g'), 
                '[0-9]', '', 'g')
        ),
        ' ', '1') = 'DR'
    then 'DR'::prefix
    end as title,

    initcap(split_part (
        upper (
            regexp_replace(
                regexp_replace(full_name, '[^[:ascii:]]', '', 'g'), 
                '[0-9]', '', 'g')
        ),
        ' ', '2')) as first_name,

    initcap(split_part (
        upper (
            regexp_replace(
                regexp_replace(full_name, '[^[:ascii:]]', '', 'g'), 
                '[0-9]', '', 'g')
        ),
        ' ', '3')) as last_name,

    concat(
        lpad((regexp_split_to_array(regexp_replace(phone, '[^[:digit:]|^\.|^\-]', '', 'g'), '(\.|\-)'))[1], 3, '0'),
        '.',
        lpad((regexp_split_to_array(regexp_replace(phone, '[^[:digit:]|^\.|^\-]', '', 'g'), '(\.|\-)'))[2], 3, '0'),
        '.',
        lpad((regexp_split_to_array(regexp_replace(phone, '[^[:digit:]|^\.|^\-]', '', 'g'), '(\.|\-)'))[3], 3, '0')
    ) as phone,
    
    email,
    favorite::boolean,
    created_at::timestamp
    
from dtf.madelines_contacts_corrupted;

create type prefix as enum (
    'MRS',
    'MS',
    'MR',
    'DR'
);

create table dtf.madelines_contacts (
    id int primary key,
    title prefix,
    first_name text,
    last_name text,
    phone text,
    email text,
    favorite boolean,
    created_at timestamp
);

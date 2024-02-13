create table rr_times.translated_headlines (
    id serial primary key,
    title text not null,
    subtitle text
);

create table rr_times.issues (
    id serial primary key,
    issued_at date, 
    language varchar(2),
    country varchar(2),
    translated_headline_id serial 
        references rr_times.translated_headlines (id)
        on delete restrict,

    foreign key (language, country)
        references rr_times.locales (language_code, country_code)
        on delete set null
);


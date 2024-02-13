create schema rr_times;

drop table if exists rr_times.locales cascade;
drop table if exists rr_times.translated_articles cascade;
create table rr_times.locales (
    language_code varchar(2),
    country_code varchar(2),
    name varchar(50) unique not null,

    primary key (language_code, country_code)
);

create table rr_times.translated_articles (
    id serial primary key,
    title text not null,
    body text not null
);

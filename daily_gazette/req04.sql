create table rr_times.articles (
    id serial primary key,
    translated_article_id serial 
        references rr_times.translated_articles (id)
        on delete cascade,
    rubric_id serial 
        references rr_times.rubrics (id)
        on delete cascade,
    language varchar(2),
    country varchar(2),

    foreign key (language, country)
    references rr_times.locales (language_code, country_code)
    on delete cascade
);

create type rr_times.rubric_theme as enum (
    'TECHNOLOGY',
    'ECONOMY',
    'HEALTH',
    'SPORT',
    'CULTURE',
    'POLITICS',
    'SCIENCE',
    'TRAVEL',
    'SOCIETY',
    'ENVIRONMENT',
    'EDUCATION',
    'MEDIA',
    'FASHION',
    'ARCHITECTURE',
    'BUSINESS',
    'SPACE'
);

create table rr_times.rubrics (
    id serial primary key,
    theme rr_times.rubric_theme,
    nb_columns int,
    issue_id serial references rr_times.issues (id) on delete cascade,

    unique(theme, issue_id)
);

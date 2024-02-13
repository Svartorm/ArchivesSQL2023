create schema nexus;
create schema nexus_it;
create schema techwave;
create schema finstar;
create schema nexus_food;
create schema guardforce;


create type nexus.position as enum (
    'JUNIOR',
    'SENIOR',
    'MANAGER',
    'DIRECTOR'
);

create type nexus.relationship_type as enum (
    'PARENT',
    'SUBSIDIARY',
    'AFFILIATE'
);

create type nexus_food.nutriscore as enum (
    'A',
    'B',
    'C',
    'D',
    'E'
);


create table nexus.employees (
    id serial primary key,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position,
    salary numeric(10,2)
);
create table nexus_it.employees (
    id serial primary key,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position,
    salary numeric(10,2)
);
create table techwave.employees (
    id serial primary key,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position,
    salary numeric(10,2)
);
create table finstar.employees (
    id serial primary key,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position,
    salary numeric(10,2)
);
create table nexus_food.employees (
    id serial primary key,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position,
    salary numeric(10,2)
);
create table guardforce.employees (
    id serial primary key,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position,
    salary numeric(10,2)
);

create table nexus.nexus_relations (
    id serial primary key,
    parent_company varchar(25),
    child_company varchar(25),
    relationship_type nexus.relationship_type
);

create table nexus_it.software_assets (
    id serial primary key,
    software_name varchar(50),
    license_key uuid,
    expiration_date date
);

create table techwave.project_milestones (
    id serial primary key,
    milestone_name varchar(50),
    due_date date,
    completion_status boolean
);

create table finstar.investments (
    id serial primary key,
    investment_name varchar(50),
    investment_type varchar(25),
    amount_invested numeric(15,5),
    date_invested date
);

create table nexus_food.products (
    id serial primary key,
    product_name varchar(25),
    product_nutriscore nexus_food.nutriscore
);

create table guardforce.incident_reports (
    id serial primary key,
    incident_description text,
    incident_date timestamp,
    incident_location varchar(50),
    reported_by varchar(50)
);


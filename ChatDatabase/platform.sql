create schema if not exists device_platform_schema;
drop table if exists device_platform_schema.device_platform;

create table device_platform_schema.device_platform (
    platform_id integer not null ,
    platform_name text not null
);
create schema if not exists device_platform_schema;
drop table if exists device_platform_schema.device_platform;

create table device_platform_schema.device_platform (
    platform_id integer primary key  ,
    platform_name text not null
);

insert into device_platform_schema.device_platform values (1, 'IOS');
insert into device_platform_schema.device_platform values (2, 'Android');

/* Загрузка из csv */
copy device_platform_schema.device_platform from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/platform.csv' with delimiter ',' csv header;

select * from device_platform_schema.device_platform;
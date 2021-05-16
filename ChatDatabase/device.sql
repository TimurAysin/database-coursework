create schema if not exists user_device_schema;
drop table if exists user_device_schema.user_device;

create table user_device_schema.user_device (
    device_id integer primary key ,
    user_id integer not null,
    foreign key (user_id) references chat_user_schema.chat_user (user_id),
    device_name text not null,
    platform_id integer not null
);
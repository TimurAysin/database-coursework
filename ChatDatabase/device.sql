create schema if not exists user_device_schema;
drop table if exists user_device_schema.user_device;

create table user_device_schema.user_device (
    device_id integer primary key ,
    user_id integer not null,
    foreign key (user_id) references chat_user_schema.chat_user (user_id) on delete cascade ,
    device_name text not null,
    platform_id integer not null,
    foreign key (platform_id) references device_platform_schema.device_platform(platform_id) on delete cascade
);

/* CRUD */
insert into user_device_schema.user_device values (1,1,'IPHONE 10', 1);
insert into user_device_schema.user_device values (2,2,'GOOGLE Pixel 5', 1);

/* Загрузка из csv */
copy user_device_schema.user_device from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/devices.csv' with delimiter ',' csv header;

select * from user_device_schema.user_device;
update user_device_schema.user_device set device_name='Unknown' where platform_id=1;
delete from user_device_schema.user_device where device_id=1;
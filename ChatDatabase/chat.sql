create schema if not exists chat_schema;
drop table if exists chat_schema.chat cascade;

create table chat_schema.chat (
    chat_id serial primary key ,
    chat_name text not null ,
    count_users integer check ( count_users > 0 ),
    count_media integer check ( count_media >= 0 ),
    count_messages integer check (count_messages >= 0),
    valid_from_dttm date default date(now()) not null,
    valid_to_dttm date default date(now()) not null
);

insert into chat_schema.chat (chat_name) values ('MyChat1');
insert into chat_schema.chat (chat_name, count_users, count_media, valid_from_dttm) values ('MyChat2', 1, 100, date('2021-01-01'));

/* Загрузка из csv */
copy chat_schema.chat(chat_name, count_users, count_media, count_messages)
    from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/chat_data.csv' with delimiter ',' csv header;

select * from chat_schema.chat;
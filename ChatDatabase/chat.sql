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

/* CRUD */
insert into chat_schema.chat (chat_name) values ('MyChat1');
insert into chat_schema.chat (chat_name, count_users, count_media, count_messages, valid_from_dttm) values ('MyChat2', 1, 100, 1, date('2021-01-01'));

/* Загрузка из csv */
copy chat_schema.chat(chat_name, count_users, count_media, count_messages)
    from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/chat_data.csv' with delimiter ',' csv header;

select * from chat_schema.chat;
update chat_schema.chat set count_users = 10 where chat_id = 2;
delete from chat_schema.chat where chat_name = 'MyChat1';
insert into chat_schema.chat (chat_name, count_users, count_media, count_messages) values ('MyChat2', 2, 100, 1);
insert into chat_schema.chat (chat_name, count_users, count_media, count_messages) values ('MyChat3', 5, 100, 1);
insert into chat_schema.chat (chat_name, count_users, count_media, count_messages) values ('MyChat3', 7, 100, 1);
insert into chat_schema.chat (chat_name, count_users, count_media, count_messages) values ('MyChat4', 7, 100, 1);

/* Запросы */

/* Все чаты, сгруппированные по именам, в группе которых есть хотя бы одно сообщение, и упорядоченные по количеству группы. */
select chat_name, count(chat_id) from chat_schema.chat group by chat_name having (count(count_messages) > 0) order by count(chat_id);

/* Общее число чатов, в которых есть хотя бы 2 пользователя */
select chat_name, count_users from chat_schema.chat group by chat_id having (count_users >= 2) order by count_users;

/* Чат с максимальным числом медиа файлов, существующий до сегодняшнего дня */
select chat_id, chat_name, count_users from chat_schema.chat where
    count_users = (select max(count_users) from chat_schema.chat group by valid_to_dttm having (valid_to_dttm = date(now())));

/* Самое популярное имя чата */
select chat_name, count_users from chat_schema.chat where
    count_users = (select max(cu) from (select chat_name, sum(count_users) as cu from chat_schema.chat group by chat_name) as foo);

/* Соотношение количества пользователей в каждом чате со средним числом людей, которые общаются в чате с тем же именем */
select chat_name, count_users, avg(count_users) over (partition by chat_name) from chat_schema.chat;

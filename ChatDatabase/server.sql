create schema if not exists chat_server_schema;
drop table if exists chat_server_schema.chat_server;

create table chat_server_schema.chat_server (
  server_id integer primary key ,
  count_users integer check (count_users >= 0),
  count_chats integer check (count_chats >= 0)
);

insert into chat_server_schema.chat_server values (1, 0, 0);
insert into chat_server_schema.chat_server values (2, 3, 3);

/* Загрузка из csv */
copy chat_server_schema.chat_server from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/server.csv' with delimiter ',' csv header;

select * from chat_server_schema.chat_server;

update chat_server_schema.chat_server set count_users = 1 where server_id = 2;
delete from chat_server_schema.chat_server where server_id = 2;
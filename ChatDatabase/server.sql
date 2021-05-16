create schema if not exists chat_server_schema;
drop table if exists chat_server_schema.chat_server;

create table chat_server_schema.chat_server (
  server_id integer primary key ,
  count_users integer check (count_users >= 0),
  count_chats integer check (count_chats >= 0)
);
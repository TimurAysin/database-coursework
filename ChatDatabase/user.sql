create schema if not exists chat_user_schema;
drop table if exists chat_user_schema.chat_user;

create table chat_user_schema.chat_user (
  user_id integer primary key ,
  name text not null,
  count_chats INTEGER not null
);
create schema if not exists chat_bot_schema;
drop table if exists chat_bot_schema.chat_bot;

create table chat_bot_schema.chat_bot (
  bot_id integer primary key ,
  bot_name text not null,
  chat_id integer not null,
  foreign key (chat_id) references chat_schema.chat (chat_id)
);
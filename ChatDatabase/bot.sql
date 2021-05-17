create schema if not exists chat_bot_schema;
drop table if exists chat_bot_schema.chat_bot;

create table chat_bot_schema.chat_bot (
  bot_id integer primary key ,
  bot_name text not null,
  chat_id integer not null,
  foreign key (chat_id) references chat_schema.chat (chat_id)
);

insert into chat_bot_schema.chat_bot values (1, 'bot1', 1);
insert into chat_bot_schema.chat_bot values (2, 'bot2', 2);

/* Загрузка из csv */
copy chat_schema.chat from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/bot.csv' with delimiter ',' csv header;

select * from chat_bot_schema.chat_bot;
update chat_bot_schema.chat_bot set bot_name = 'new_bot2' where bot_id = 2;
delete from chat_bot_schema.chat_bot where bot_id = 2;
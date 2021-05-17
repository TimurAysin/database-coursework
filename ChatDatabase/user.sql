create schema if not exists chat_user_schema;
drop table if exists chat_user_schema.chat_user;

create table chat_user_schema.chat_user (
  user_id integer primary key ,
  name text not null,
  count_chats INTEGER not null
);

insert into chat_user_schema.chat_user values (1, 'Тimur', 100);
insert into chat_user_schema.chat_user values (2, 'Max', 1);


/* Загрузка из csv */
copy chat_user_schema.chat_user from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/user.csv' with delimiter ',' csv header;

select * from chat_user_schema.chat_user;
update chat_user_schema.chat_user set name='King Timur' where name='Timur';
delete from chat_user_schema.chat_user where user_id=2;
create schema if not exists chat_message_schema;
drop table if exists chat_message_schema.chat_message;

create table chat_message_schema.chat_message (
    message_id integer primary key ,
    content text not null,
    chat_id integer,
    foreign key (chat_id) references chat_schema.chat (chat_id) on delete cascade
);

insert into chat_message_schema.chat_message values (1,'Hello',1);
insert into chat_message_schema.chat_message values (2,'Go away!',2);

/* Загрузка из csv */
copy chat_message_schema.chat_message from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/message.csv' with delimiter ',' csv header;

select * from chat_message_schema.chat_message;
update chat_message_schema.chat_message set content='New' where message_id=1;
delete from chat_message_schema.chat_message where chat_id=1;
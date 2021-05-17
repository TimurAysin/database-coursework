create schema if not exists chat_message_schema;
drop table if exists chat_message_schema.chat_message;

create table chat_message_schema.chat_message (
    message_id integer primary key ,
    content text not null,
    chat_id integer,
    foreign key (chat_id) references chat_schema.chat (chat_id)
);

insert into chat_message_schema.chat_message values (1,'Hello',1);
insert into chat_message_schema.chat_message values (2,'Go away!',2);

/* Загрузка из csv */
copy chat_message_schema.chat_message from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/message.csv' with delimiter ',' csv header;

select * from chat_message_schema.chat_message;
create schema if not exists chat_message_schema;
drop table if exists chat_message_schema.chat_message;

create table chat_message_schema.chat_message (
    message_id integer primary key ,
    content text not null,
    chat_id integer,
    foreign key (chat_id) references chat_schema.chat (chat_id)
);
create schema if not exists chat_media_schema;
drop table if exists chat_media_schema.chat_media;

create table chat_media_schema.chat_media (
    media_id integer primary key ,
    path text not null,
    message_id integer not null,
    foreign key (message_id) references chat_schema.chat (chat_id)
);
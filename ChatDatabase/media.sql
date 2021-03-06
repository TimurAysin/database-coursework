create schema if not exists chat_media_schema;
drop table if exists chat_media_schema.chat_media;

create table chat_media_schema.chat_media (

    media_id integer primary key ,
    path text not null,
    message_id integer not null,
    foreign key (message_id) references chat_schema.chat (chat_id) on delete cascade
);

/* CRUD */
insert into chat_media_schema.chat_media values (1,'./cool_gif.gif', 1);
insert into chat_media_schema.chat_media values (2,'./cool_gif2.gif', 2);

/* Загрузка из csv */
copy chat_media_schema.chat_media from '/home/aysint/Documents/Projects/coursework-chat/pgcsv/media.csv' with delimiter ',' csv header;

select * from chat_media_schema.chat_media;
update chat_media_schema.chat_media set path='./another_path_to_cool_gif' where media_id=1;
delete from chat_media_schema.chat_media where message_id=1;
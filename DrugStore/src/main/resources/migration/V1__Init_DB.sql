create sequence hibernate_sequence start 1 increment 1

create table item_like (
   item_id int8 not null,
   href varchar(255),
   img varchar(255),
   name varchar(255),
   price varchar(255),
   user_id int8,
   primary key (item_id)
)

create table usr (
   id int8 not null,
   activation_code varchar(255),
   active boolean not null,
   email varchar(255) not null,
   password varchar(255) not null,
   username varchar(255) not null,
   primary key (id)
)

alter table item_like
   add constraint item_like_usr_fk
   foreign key (user_id) references usr
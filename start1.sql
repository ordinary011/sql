create database if not exists hm1 default character set utf8;

use hm1;

create table family (
	id int primary key auto_increment not null,
    name varchar(25) not null,
    age int not null,
    gender varchar(10) not null
);



insert into family (name, age, gender) values 
	("Maxim", 20, "male"),
    ("Ira", 28, "female"),
    ("ighor", 55, "male"),
    ("Dina", 53, "fmale");
    


select * from family where name like "_a%";

select * from family where age > 15 or age < 3;

update family set age = 30 where id = 1; 



delete from family where age > 50;





select * from family;

drop table family;

















create database if not exists yyy default character set utf8;

use yyy;

create table cars (
	id int primary key auto_increment not null,
    mark varchar(20) not null,
    model varchar(20) not null,
    speed int not null,
    price int not null
);


insert into cars (mark, model, speed, price) values ('BMW', '320d', 225, 36000);
insert into cars (mark, model, speed, price) values ('volks', '320d', 225, 55555);
insert into cars (mark, model, speed, price) values ('audi', '33d', 300, 50340);
insert into cars (mark, model, speed, price) values ('audi', '13pd', 300, 50340);

select id, mark from cars;


UPDATE yyy.cars
SET model = '14ppd'
WHERE mark = 'volks';



create table clients (
	id int primary key auto_increment not null,
    name varchar(30) not null,
    age int not null,
    phone varchar(15)
    );
    
insert into clients (name, age, phone) values ('aa', 20, 0673435643);
insert into clients (name, age, phone) values ('bb', 24, 06734354343);
insert into clients (name, age, phone) values ('cc', 20, 0673435643);
insert into clients (name, age, phone) values ('dd', 33, 0673435643);
insert into clients (name, age, phone) values ('dd', 34, 0673435643);
    
    
    

UPDATE yyy.clients
SET name = 'didi',
    phone = "067*******"
WHERE name = 'dd' and age = 34;



insert into persons (your_name, surname, age , hair) values 
	("rhon", "vizley", 20, 1),
    ("Germiny", "grenger", 18, 1),
    ("big", "hagritt", 45, 0),
    ("mikkey", "mouse", 150, 1);


insert into persons () values ();

insert into persons (your_name) value ("zorro");





use yyy;

# DROP TABLE clients;

ALTER TABLE yyy.cars CHANGE id idCars INT AUTO_INCREMENT;

ALTER TABLE yyy.persons CHANGE id idPersons INT AUTO_INCREMENT;



create table relation
(
  idRelation int not null,
  cars_idCars INT,
  PERSONS_idpERSONS INT,
  PRIMARY KEY (idRelation)
);

ALTER TABLE relation CHANGE idRelation idRelation INT AUTO_INCREMENT NOT NULL;

ALTER TABLE relation CHANGE PERSONS_idPersons Persons_idPersons INT;

ALTER TABLE relation CHANGE cars_idCars Cars_idCars INT;


ALTER TABLE relation
 ADD CONSTRAINT fk_relation_cars
  FOREIGN KEY relation(cars_idCars)
    REFERENCES yyy.cars(idCars);


ALTER TABLE relation
  ADD CONSTRAINT fk_relation_persons
  FOREIGN KEY relation(PERSONS_idPersons)
      REFERENCES yyy.persons(idPersons);


# ALTER TABLE relation DROP FOREIGN KEY links;


INSERT INTO relation (Cars_idCars, Persons_idPersons)
VALUES
       (1, 2),
       (1, 4),
       (3, 5),
       (4, 6),
       (3, 7),
       (6, 4),
       (5, 7);


SELECT idPersons, your_name, idCars, Mark FROM yyy.persons p
right JOIN yyy.relation rel ON p.idPersons = rel.Persons_idPersons
right JOIN yyy.cars c ON c.idCars = rel.Cars_idCars;


























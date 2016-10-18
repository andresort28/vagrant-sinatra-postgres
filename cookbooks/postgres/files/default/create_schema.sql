create user userandres with password 'passortiz';
alter role userandres with createdb;
create database swn owner userandres;
\connect swn

CREATE TABLE brands(
       id     integer NOT NULL PRIMARY KEY,
       brand_name  varchar(50) NOT NULL UNIQUE
);

CREATE TABLE devices(
       id     integer NOT NULL PRIMARY KEY,
       device_name  varchar(50) NOT NULL UNIQUE,
       brand_id integer references brands(id)
);

grant all privileges on table devices to userandres;
grant all privileges on table brands to userandres;

INSERT INTO brands (id, brand_name) VALUES (1 , 'Samsung');
INSERT INTO brands (id, brand_name) VALUES (2 , 'HTC');
INSERT INTO brands (id, brand_name) VALUES (3 , 'Huawei');
INSERT INTO brands (id, brand_name) VALUES (4 , 'Sony');
INSERT INTO brands (id, brand_name) VALUES (5 , 'Xiaomi');
INSERT INTO brands (id, brand_name) VALUES (6 , 'Apple');


INSERT INTO devices (id, device_name, brand_id) VALUES (1 , 'Samsung Galaxy s7 edge', 1);
INSERT INTO devices (id, device_name, brand_id) VALUES (2 , 'Samsung Galaxy s7', 1);
INSERT INTO devices (id, device_name, brand_id) VALUES (3 , 'HTC 10', 2);
INSERT INTO devices (id, device_name, brand_id) VALUES (4 , 'Huawei P9', 3);
INSERT INTO devices (id, device_name, brand_id) VALUES (5 , 'Samsung Galaxy s6', 1);
INSERT INTO devices (id, device_name, brand_id) VALUES (6 , 'Sony Xperia Z5', 4);
INSERT INTO devices (id, device_name, brand_id) VALUES (7 , 'Xiaomi Mi 5', 5);
INSERT INTO devices (id, device_name, brand_id) VALUES (8 , 'Huawei Mate', 3);
INSERT INTO devices (id, device_name, brand_id) VALUES (9 , 'iPhone 6s plus', 6);
INSERT INTO devices (id, device_name, brand_id) VALUES (10 , 'iPhone 6s', 6);
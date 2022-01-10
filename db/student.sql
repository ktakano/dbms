CREATE DATABASE IF NOT EXISTS dbtest CHARACTER SET utf8;

CREATE TABLE student (
  id varchar(16) PRIMARY KEY,
  name varchar(256),
  ename varchar(256)
);

INSERT INTO student(id, name, ename) VALUES ('2021001', '鷹野', 'Takano');
INSERT INTO student(id, name, ename) VALUES ('2021002', '鈴木', 'Suzuki');
INSERT INTO student(id, name, ename) VALUES ('2021003', '佐藤', 'Sato');

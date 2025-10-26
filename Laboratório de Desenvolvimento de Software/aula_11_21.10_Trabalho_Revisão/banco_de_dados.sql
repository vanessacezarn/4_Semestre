-- COMANDO UTILIZADOS PARA CRIAÇÃO DO BANCO DE DADOS
create database revisao;
show databases;
/*
+--------------------+
| Database           |
+--------------------+
| bdaula01           |
| escola             |
| information_schema |
| mysql              |
| performance_schema |
| produtos           |
| revisao            |
| sakila             |
| sys                |
| veiculos           |
| world              |
+--------------------+
*/
use revisao;

create table professores(
  id int auto_increment primary key,
  nome varchar(60) not null,
  email varchar(60) unique
);

create table disciplinas(
  id int auto_increment primary key,
  nome varchar(80) not null,
  carga_horaria int not null,
  professor_id int not null,
  foreign key(professor_id) references professores(id)
  );

show tables;
/*
+-------------------+
| Tables_in_revisao |
+-------------------+
| disciplinas       |
| professores       |
+-------------------+
*/

 desc disciplinas;
/*
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| id            | int         | NO   | PRI | NULL    | auto_increment |
| nome          | varchar(80) | NO   |     | NULL    |                |
| carga_horaria | int         | NO   |     | NULL    |                |
| professor_id  | int         | NO   | MUL | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
*/

desc professores;
/*
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| nome  | varchar(60) | NO   |     | NULL    |                |
| email | varchar(60) | YES  | UNI | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
*/

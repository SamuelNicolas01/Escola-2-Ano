create database Recepcao_Escola;

use Recepcao_Escola;

create table Visitante (
	idVisitante int primary key not null auto_increment,
    nome varchar(80) not null,
    endereco varchar(100) not null,
    telefone varchar(11) not null,
    rg varchar(9) not null,
    cpf varchar(11) not null,
    dt_nasc date not null,
    dt_visita datetime not null
);

insert into Visitante(nome, endereco, telefone, rg, cpf, dt_nasc, dt_visita) values
("Rogério Ceni", 
"Rua Morumbi", 
"11982354121", 
"123456789", 
"28765412101", 
"2010-05-13",
"2024-09-15 14:30:00");

insert into Visitante(nome, endereco, telefone, rg, cpf, dt_nasc, dt_visita) values
("Léo Pelé", 
"Rua Belbarro", 
"11223256789", 
"985657821", 
"11432587091", 
"2009-04-17",
"2021-12-01 14:30:15");

select * from Visitante
where nome like '%Rogério%';

select * from Visitante
where dt_visita like '%14:30%';

select * from Visitante


/*Comando para criar o banco de dados*/
create database Concessionaria;

/*Comando para carregar o Banco de Dados na memória do PC*/
use Concessionaria;

/*Comandopara criar as tabelas*/
create table Propietario(
idPropietario int primary key not null auto_increment,
nome varchar(45) not null ,
endereco varchar(120) not null,
cpf varchar(11) not null
);

create table carro(
idCarro int primary key not null auto_increment,
modelo varchar(45) not null,
motor decimal(2,1) not null,
combustivel varchar(45) not null,
placa varchar(7) not null
);

create table montadora(
idMontadora int primary key auto_increment,
nome varchar(45) not null
);

/* alteração da estrutura das tabelas */
alter table carro add idMontadora int not null;

/* adicionando uma constraint na váriavel e 
tornando ela chave estrangeira*/
alter table carro add constraint fkCarroMontadora
foreign key(idMontadora)
references Montadora(idMontadora);

alter table carro add idPropietario int not null;

alter table carro add constraint fkCarroropietario
foreign key(idPropietario)
references Propietario(idPropietario);

/* inserir dados nas tabelas: Comando INSERT INTO*/
/*
insert into propietario(nome, endereco, cpf) values
("Julio Cesar Torresmo","Rua Tupinambas 211", "12345678910");/*inserção de dados*/

/*Realizar pesquisa: comando SELECT*/
/*select * from propietario;

insert into montadora(nome) values
("Chevrolet");

insert into carro(modelo, motor, combustivel, placa, idmontadora, idpropietario) values
("Corsa", 1.0,"Gasolina","BNM5A55",1,1);

insert into propietario(nome,endereco,cpf) values
("Maria das Graças Aguiar", "Avenida Francisco Morato, 3752 - Bloco D - apto 75", "12345678910");

select * from propietario;

insert into montadora(nome) values
("Hyundai"),
("Fiat"),
("Volkswagen"),
("Honda");

select * from montadora;

insert into carro(modelo, motor, combustivel, placa, idmontadora, idpropietario) values
("Uno",1.0,"Gasolina","ADO1I55",3,2),
("Civic",2.0,"Flex","DAN9C33",5,2)
;

select * from propietario;
select * from carro;
select * from montadora;

select nome, endereco, modelo from propietario
inner join carro
on propietario.idpropietario = carro.idpropietario
where modelo = "Uno";

select * from propietario inner join carro
on propietario.idpropietario = carro.idpropietario
inner join montadora
on carro.idmontadora = montadora.idmontadora;*/

insert into Propietario(nome, endereco, cpf) values 
("Silas Tavares", "Rua Tamoios, 709", '323456789'),
("Josué Mendes", "Rua Pataxos, 709", '323456790'),
("Cibele Souza", "Rua Makunas, 709", '323456791'),
("Marta da Silva", "Rua Xavantes, 709", '323456792'),
("Mirela Muniz", "Rua Tamoios, 709", '3234endereco56793'),
("Clovis Toledo", "Rua Tupinambás, 709", '323456794'),
("Cleide Santana", "Rua Caiapos, 709", '323456795'),
("Tomas Braga", "Rua Sirianos, 709", '323456796'),
("Teresa Castro", "Rua Tupiniquins, 709", '323456797'),
("Bernardo Pimentel", "Rua Guaranis 709", '323456798'),
("Sonia Ribeiro", "Rua Yanomamis, 709", '323456799'),
("Sandro Fontes", "Rua Macuxis, 709", '323456100');

insert into montadora(nome) values
("Toyota"),
("General Motors"),
("Ford"),
("Fiat"),
("Honda"),
("Hyundai"),
("Renault"),
("Mercedes"),
("Cherry"),
("Chrysler"),
("Volkswagen"),
("Nissan"),
("Kia");

insert into carro(modelo, motor, combustivel, placa, 
idMontadora, idPropietario) values
("Argo", 1.3, "flex", "JKI9C78", 4, 3),
("HB20", 1.0, "flex", "KHG8E60", 6, 1),
("Duster", 1.6, "flex", "RDE6M91", 7, 4),
("Hillux", 2.8, "diesel", "HGN9E72", 1, 7),
("Logan", 1.0, "flex", "UIA5S36", 7, 8),
("Cruze", 1.8, "flex", "SAA2I34", 2, 10),
("ix35", 2.0, "flex", "DLO6B83", 6, 5),
("Onix", 1.0, "flex", "CPO5J11", 2, 12),
("Mobi", 1.0, "flex", "BAA8O64", 4, 11),
("Toro", 1.3, "flex", "NMA7F34", 4, 6),
("Corolla", 1.8, "Hibrido flex", "QDS0E74", 1, 2),
("Civic", 2.0, "flex", "FGK2O87", 5, 9);

select * from montadora;

/*1 –  são os carros da Hyundai?*/
select modelo from carro inner join montadora
on carro.idMontadora = montadora.idMontadora 
where nome = "hyundai";
/*2 - Quais carros são híbridos flex?*/

select modelo, combustivel from carro
where combustivel = "hibrido flex";

/*3 - A quem pertence o Onix?*/

select nome,modelo from propietario inner join carro
on propietario.idPropietario = carro.idPropietario
where modelo = "Onix";

/*4 – Qual montador fabrica a toro*/
select modelo,nome from carro inner join montadora
on carro.idMontadora =  montadora.idMontadora
where modelo = "Toro";

/*5 – Quem tem carro da Renault?*/
select propietario.nome,modelo, montadora.nome 
from propietario inner join carro
on propietario.idPropietario = carro.idPropietario 
inner join montadora
on carro.idMontadora = montadora.idMontadora
where montadora.nome = "Renault";

/*6 – Qual é o nome e endereço do dono da Duster?*/
select nome,endereco,modelo from propietario 
inner join carro
on propietario.idPropietario = carro.idPropietario
where modelo = "Duster";

/*7 – Qual é o endereço da Cibele?*/
select nome, endereco from propietario
where nome like "%cibele%";

/*8 – Quais são os carros 1.0 cadastrados?*/
select modelo, motor from carro
where motor = "1,0";

select * from carro
select * from propietario

/*9 – Quem são os donos dos carros com motorização igual ou superior a 2.0?*/
select propietario.nome
from carro 
inner join propietario
on carro.idPropietario = propietario.idPropietario
where carro.motor >= 2.0;


/*10 – Qual é a placa do carro da Teresa?*/
select carro.placa from propietario
inner join carro on propietario.idPropietario = carro.idPropietario
where propietario.nome like '%Teresa%'

/*comando para criar o banco de dados: create database nome*/
create database concessionaria;

/*comando para carregar o banco de dados na memoria do computador*/
use concessionaria;

/*comando para criar tabela no banco de dados */
create table proprietario ( 
	idProprietario int primary key not null auto_increment,
    nome varchar(45) not null,
    endereco varchar(120) not null,
    cpf varchar(11)
);

create table carro (
	idCarro int primary key not null auto_increment,
    modelo varchar(45) not null,
    motor decimal(2,1) not null,
    combustivel varchar(45) not null,
    placa varchar(7) not null
);

create table montadora (
	idMontadora int primary key not null auto_increment,
    nome varchar(45) not null
);

/* alteração da estrutura das tabelas */
alter table carro add idMontadora int not null;

/*adicionado uma constraint (condiçao) na variavel e tornando ela chave estrangeira*/
alter table carro add constraint 
fkCarroMontadora foreign key(idMontadora) 
references Montadora(idMontadora);

alter table carro add idProprietario int not null;
alter table carro add constraint 
fkCarroProprietario foreign key(idProprietario) 
references Proprietario(idProprietario);

/*Select; comando de pesuisa*/
select * from proprietario;
select * from carro;
select * from montadora;

/*Inserir dados em uma tabela; comando INSERT INTO*/
/*insert into proprietario(nome, endereco, cpf) values 
("Juliano Floss", "Rua Tupimamar, 229", "12345678910");

insert into proprietario(nome, endereco, cpf) values 
("Sandra Marques", "Av. Francisco Morato, 3279", "12345678911");

insert into montadora(nome) values
("Fiat");

insert into carro(modelo, motor, combustivel, placa, idmontadora, idproprietario) values
("Uno", 1.0, "Gasolina", "FGH8E46", 1, 1);

insert into montadora(nome) values
("Ford"),
("Hyundai"),
("Honda"),
("Volksvagen"); 

select * from montadora;

insert into carro(modelo, motor, combustivel, placa, idmontadora, idproprietario) values
("Creta", 1.6, "Flex", "BNA6C44", 3, 2),
("Civic", 2.0, "Flex", "AUS2J22", 4, 1);

select modelo, motor from carro
where combustivel = "gasolina";

SELECT proprietario.nome, carro.modelo, carro.placa
FROM carro
INNER JOIN proprietario
    ON proprietario.idproprietario = carro.idproprietario
WHERE proprietario.nome = "Juliano Floss";

Select * from proprietario inner join carro
on proprietario.idproprietario = carro.idproprietario
inner join montadora
on carro.idmontadora = montadora.idmontadora;*/

insert into proprietario(nome, endereco, cpf) values 
("Silas Tavares", "Rua Tamoios, 709", '323456789'),
("Josué Mendes", "Rua Pataxos, 709", '323456790'),
("Cibele Souza", "Rua Makunas, 709", '323456791'),
("Marta da Silva", "Rua Xavantes, 709", '323456792'),
("Mirela Muniz", "Rua Tamoios, 709", '323456793'),
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

insert into carro(modelo, motor, combustivel, placa, idmontadora, idproprietario) values
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

/*1 – Quais são os carros da Hyundai?*/
SELECT carro.modelo
FROM carro
INNER JOIN montadora
ON carro.idMontadora = montadora.idMontadora
WHERE montadora.nome = 'Hyundai';

/*2 - Quais carros são híbridos flex?*/
SELECT modelo
FROM carro
WHERE combustivel = 'Hibrido Flex';

/*3 - A quem pertence o Onix?*/
SELECT proprietario.nome
FROM carro
INNER JOIN proprietario
ON carro.idProprietario = proprietario.idProprietario
WHERE carro.modelo = 'Onix';

/*4 – Qual montadora fabrica a Toro?*/
SELECT montadora.nome 
FROM carro
INNER JOIN montadora
ON carro.idMontadora = montadora.idMontadora
WHERE carro.modelo = 'Toro';
/*5 – Quem tem carro da Renault?*/
SELECT proprietario.nome
FROM proprietario
INNER JOIN carro
ON proprietario.idProprietario = carro.idProprietario
INNER JOIN montadora
ON carro.idMontadora = montadora.idMontadora
WHERE montadora.nome = 'Renault';

/*6 – Qual é o nome e endereço do dono da Duster?*/
SELECT proprietario.nome, proprietario.endereco
from carro
inner join proprietario
on carro.idProprietario = proprietario.idProprietario
where carro.modelo = 'Duster';
/*7 – Qual é o endereço da Cibele?*/
select nome, endereco
from proprietario
where nome like '%Cibele%';
/*8 – Quais são os carros 1.0 cadastrados?*/
select modelo
from carro
where motor = '1.0';
/*9 – Quem são os donos dos carros com motorização igual ou superior a 2.0?*/
select proprietario.nome
from carro 
inner join proprietario
on carro.idProprietario = proprietario.idProprietario
where carro.motor >= 2.0;

/*10 – Qual é a placa do carro da Teresa?*/
select carro.placa
from proprietario
inner join carro
on proprietario.idProprietario = carro.idProprietario
where proprietario.nome like '%Teresa%'
Create database ClinicaOdontologica;

use ClinicaOdontologica;

create table cliente
(
idcliente int primary key auto_increment,
nome varchar(50) not null,
tel varchar(11) not null,
dt_nasc date not null
);

create table especialidade
(
idespec int primary key auto_increment,
tipo varchar(50) not null
);

create table dentista
(
cfo int primary key,
nome varchar(50) not null,
tel varchar(11) not null,
idespec int not null,
foreign key(idespec) references especialidade(idespec)
);

create table exame
(
idexame int primary key auto_increment,
nome varchar(50) not null
);

create table consulta
(
idconsulta int primary key auto_increment,
idcliente int not null,
cfo int not null,
idexame int,
dt_consulta date not null, 
hora time not null,
foreign key(idcliente) references cliente(idcliente),
foreign key(cfo) references dentista(cfo),
foreign key(idexame) references exame(idexame)
);

insert into cliente(nome, tel, dt_nasc) values
('Tomaz Queiroz Teixeira', '1148484848', '1981-03-11'),
('Sonia Maria Pacheco', '11999888888', '1961-11-19'),
('Samira Munhoz da Silva', '11966665555', '2001-12-27'),
('Maria da Conceição Aguiar', '1146851111', '1999-05-17'),
('Sonia da Silva Menezes Teixeira', '1943576321', '1989-04-06'),
('Marcelo Sinval Moreira', '21955552222', '1990-07-03'),
('Roberto Damasceno de Souza', '11922221111', '1989-01-02'),
('Guilherme Santos Sousa', '11988111122', '1979-09-07'),
('Miguel Josias Tavares Saraiva', '1143581379', '2002-05-05'),
('Sandra Dourado Maciel', '31922555522', '1997-10-13'),
('Marcelo Santos Moreira', '11933332222', '1995-07-03'),
('Celso Michel Santana', '11911119999', '2011-04-23'),
('Samira Reale Machado', '11946324234', '2013-02-25'),
('Maria Auxiliadora Ressurreição de Jesus', '11910101111', '1983-12-27'),
('Sandro da Silva Sousa', '1146504650', '1999-08-15'),
('Simone Guedes da Silva', '1145794679','2003-05-17'),
('Guilherme Trindade de Jesus', '19925874123', '1987-03-16'),
('Cibele Catherine Goncalves Moreira', '1145689520', '1999-02-02'),
('Magda Santana Tavares', '11999227733', '2011-10-29'),
('Manoel de Jesus Tomaz', '1198787985', '2006-11-27'),
('Sidney Machado de Souza', '11996633221', '2013-07-26'),
('Josias Manoel Santos Teixeira', '11992255641', '1971-04-11'),
('Santiago Gimenez Sanchez', '991566235', '1996-12-01'), 
('Marcelo de Jesus Teles', '11996457846','1999-04-22'),
('João Miguel Moreira Santos', '11952365421', '1991-11-18'),
('Jaqueline Manoela Silva Santana', '11997231546', '2005-08-21'),
('Jessica Teixeira dos Santos', '11943525874', '2000-01-01'),
('Camila de Souza Aguiar', '1148657412', '1997-03-18'),
('Cristiane Neves Manoel', '11985856237', '2002-12-19'),
('Tereza Conceição Amorim Neves', '11921538476', '2006-10-15')
;

Insert into especialidade(tipo) values
('Cirurgia e traumatologia e dor orofacial'),
('Dentística'),
('Disfunção temporomandibular e dor orofacial'),
('Endodontia'),
('Estomatologia'),
('Harmonização orofacial'),
('Implantodontia'),
('Odontogeriatria'),
('Odontopediatria'),
('Ortodontia'),
('Ortopedia funcional dos maxilares'),
('Patologia oral e maxilo facial'),
('Periodontia'),
('Prótese buco maxilo facial'),
('Prótese dentária'),
('Radiologia odontológica e imaginologia')
;

Insert into dentista values
(1123,'Sueli Fagundes dos Santos','1145794679', 2),
(1719,'Michele Santana Silva', '11996821472', 7),
(2385,'Moacir Gonçalves Salatiel','11965428525', 10),
(1715,'Jonas Machado da Silva','11935857674', 9),
(3611,'Solange Cristina Livramento','11987848685', 10),
(4520,'Celso Manoel Fagundes Viana','11956233526', 2),
(1187,'Beatriz Livramento de Jesus','11994979897', 4),
(1619,'Bruno Santos e Silva', '11991929098', 10),
(3895,'Gustavo Viana Moreira', '11985212320', 4)
;

insert into exame(nome) values
('Radiografia intrabucal'),
('Radiografia extrabucal'),
('Tomografia computadorizada'),
('Radiografia interproximal – Bite Wing'),
('Radiografia oclusal'),
('Radiografia panorâmica para mandíbula e maxilar'),
('Teste do fluxo salivar'),
('Teste de PH salivar'),
('Radiografia periapical')
;
Select * from cliente;
select * from dentista;
select * from exame;
select * from especialidade;
select * from consulta;



insert into consulta(idcliente, cfo, idexame, dt_consulta, hora) values
(3, 2385, 9, '2024-09-03', '8:30'),
(14, 1715, 9, '2024-09-03', '9:00'),
(27, 4520, 6, '2024-09-03', '10:35'),
(29, 1715, 4, '2024-09-03', '14:45')
;

insert into consulta(idcliente, cfo, dt_consulta, hora) values
(1, 1719, '2024-09-03', '8:00'),
(2, 1719, '2024-09-04', '9:30'),
(5, 3895, '2024-09-04', '16:00'),
(7, 1719, '2024-09-05', '14:30'),
(11, 3895, '2024-09-05', '17:45'),
(5, 3895, '2024-09-11', '16:00'),
(1, 1719, '2024-09-11', '8:00'),
(2, 1719, '2024-09-11', '9:30'),
(7, 1719, '2024-09-12', '14:30'),
(3, 4520, '2024-09-12', '08:30'),
(5, 3895, '2024-09-14', '14:00'),
(7, 1719, '2024-09-15', '14:30'),
(10, 2385, '2024-09-15', '11:00'),
(5, 3895, '2024-09-19', '17:00'),
(7, 1719, '2024-09-21', '14:30'),
(2, 1719, '2024-09-25', '9:30'),
(1, 1719, '2024-09-27', '8:00'),
(2, 1719, '2024-09-27', '9:30'),
(5, 3895, '2024-09-27', '16:00'),
(11, 3895, '2024-09-27', '17:45'),
(3, 4520, '2024-09-28', '09:30'),
(7, 1719, '2024-09-28', '11:30'),
(13, 3895, '2024-09-28', '10:00'),
(27, 3611, '2024-09-28', '17:45'),
(10, 2385, '2024-09-28', '11:00'),
(21, 1715, '2024-09-28', '13:00'),
(22, 3611, '2024-09-29', '15:20'),
(13, 3895, '2024-09-29', '10:00'),
(7, 1719, '2024-09-29', '11:30'),
(11, 3895, '2024-09-29', '17:45'),
(25, 4520, '2024-09-29', '15:30'),
(27, 3611, '2024-09-30', '17:45'),
(10, 2385, '2024-09-30', '08:00'),
(13, 3895, '2024-09-30', '10:00'),
(19, 1719, '2024-09-30', '15:10'),
(1, 1719, '2024-09-30', '10:30'),
(5, 3895, '2024-10-02', '16:00'),
(3, 4520, '2024-10-03', '08:30'),
(13, 3895, '2024-10-04', '10:00'),
(7, 1719, '2024-10-04', '11:30'),
(10, 2385, '2024-10-04', '08:00'),
(13, 3895, '2024-10-07', '11:00'),
(13, 3895, '2024-10-10', '10:00'),
(11, 3895, '2024-10-15', '17:45'),
(5, 3895, '2024-10-15', '10:00'),
(3, 4520, '2024-10-15', '08:30'),
(10, 2385, '2024-10-15', '08:00'),
(22, 3611, '2024-10-18', '15:20'),
(27, 3611, '2024-10-18', '17:45'),
(3, 4520, '2024-10-18', '08:30'),
(11, 3895, '2024-10-18', '10:00'),
(21, 1715, '2024-10-19', '13:00'),
(13, 3895, '2024-10-19', '10:00'),
(11, 3895, '2024-10-20', '10:00'),
(10, 2385, '2024-10-20', '08:00'),
(3, 4520, '2024-10-22', '08:30'),
(11, 3895, '2024-10-22', '10:00'),
(5, 3895, '2024-10-25', '10:00'),
(10, 2385, '2024-10-27', '08:00'),
(3, 4520, '2024-10-30', '08:30'),
(11, 3895, '2024-10-30', '10:00')
;

/* 1 - Quais são as especialidades dos dentistas ? */
select nome,tipo
from dentista
inner join especialidade
on dentista.idespec = especialidade.idespec
order by nome;

/* 2 - Quantos dentistas de cada especialidade há cadastro no banco de dados? */
select tipo,count(*) from dentista group by especialidade
inner join especialidade on dentista.idespec = especialidade.idespec
group by tipo;

/* 3 - Quais são os clientes agendados para a Dra. Beatriz? */
select cliente.nome, dentista.nome, dt_consulta, hora 
from dentista
inner join consulta on dentista.cfo = consulta.cfo
inner join cliente on consulta.idcliente = cliente.idcliente
where dentista.nome like "%Beatriz%";

/* 4 - Quais as consultas agendadas para o Dr. Moacir e para a Dra. Solange? */
select dentista.nome from dentista where dentista.nome like "%Moacrir%" & "%Solange%";

/* 5 - Quais os pacientes passarão em consulta com um especialsta em ortodontia ou endodontia? */




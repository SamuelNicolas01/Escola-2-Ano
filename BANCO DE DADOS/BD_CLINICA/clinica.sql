create database clinica;

use clinica;

create table consulta (
	idConsulta int primary key not null auto_increment,
	dt date not null,
    hora time not null
);

create table paciente (
	idPaciente int primary key not null auto_increment,
	nome varchar(80),
    telefone varchar (11),
    dt_nasc date
);

create table exame (
	idExame int primary key not null auto_increment,
    tipo varchar (45) not null
);

create table dentista (
	cfo int primary key not null auto_increment,
    nome varchar(80) not null,
    telefone int (11) not null
);

create table especialidade (
	idespecialidade int primary key not null auto_increment,
    especialidade varchar (45) not null
);

/*adicionando chave estrangeira em consulta*/
alter table consulta add idPaciente int not null;

alter table consulta add constraint
fkConsultaPaciente foreign key(idPaciente)
references paciente(idPaciente);

alter table consulta add idExame int not null;

alter table consulta add constraint
fkConsultaExae foreign key(idExame)
references exame(idExame);

alter table consulta add cfo int not null;

alter table consulta add constraint
fkConsultaDentista foreign key(cfo)
references dentista(cfo);

select * from consulta;

/*adicionando chave estrangeira em dentista*/
alter table dentista add idespecialidade int not null;

alter table dentista add constraint
fkDentistaEspecialidade foreign key (idespecialidade)
references especialidade(idespecialidade);

select * from dentista;
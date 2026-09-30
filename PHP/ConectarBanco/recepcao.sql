
use recepcao; 

create table cliente(
	idCliente int primary key not null auto_increment,
    nome varchar(100) not null,
    endereco varchar(100) not null,
    tel varchar (15) not null,
    data_nasc date not null,
    rg varchar(12) not null,
    cpf varchar(14) not null,
    visita datetime not null
);
create database aulanuvem;

use aulanuvem;

create table aluno(
	id_aluno int primary key not null auto_increment,
    nome varchar(80) not null,
    matricula varchar(45) not null,
    email varchar(80) not null,
    telefone varchar(11) not null
);

create table emprestimo (
	id_emprestimo int primary key not null auto_increment,
    data_emprestimo date not null,
    data_devolução date not null,
    statu varchar(40) not null
);

create table livro (
	id_livro int primary key not null auto_increment,
    titulo varchar(80) not null,
    autor varchar(80),
    editora varchar(80),
    ano_publicacao year not null
);

alter table emprestimo add id_aluno int not null;

alter table emprestimo add constraint
fkEmprestimoAluno foreign key(id_aluno)
references aluno(id_aluno);

alter table emprestimo add id_livro int not null;

alter table emprestimo add constraint
fkEmprestimoLivro foreign key(id_livro)
references livro(id_livro);
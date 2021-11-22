show databases;

create database cinema;
use cinema;

/*drop table reserva_assentos;
drop table catalogos;
drop table assentos;
drop table exibicoes;
drop table salas;
drop table clientes;
drop table filmes; */

show tables;

create table filmes (
	id int primary key auto_increment,
    filme VARCHAR (40) not null unique,
    minutagem int not null
);
create table clientes (
	id int primary key auto_increment,
    primeiro_nome VARCHAR(40),
    ultimo_nome VARCHAR(40),
    email VARCHAR(45) not null unique
);
create table salas(
	id int primary key auto_increment,
    nome VARCHAR(40) not null,
    assento int not null
);
create table exibicoes(
	id int primary key auto_increment,
    filme_id int not null,
    sala_id int not null,
    comeco_exib datetime not null,
    foreign key (filme_id) references filmes(id),
    foreign key (sala_id) references salas(id)
);
create table assentos(
	id int primary key auto_increment,
    fila CHAR(1) not null,
    cadeira int not null,
    sala_id int not null,
    foreign key (sala_id) references salas(id)
);
create table catalogos(
	id int primary key auto_increment,
    exib_id int not null,
    cliente_id int not null,
    foreign key (exib_id) references exibicoes(id),
    foreign key (cliente_id) references clientes(id)
);
create table reserva_assentos(
	id int primary key auto_increment,
    catalogo_id int not null,
    assento_id int not null,
    foreign key (catalogo_id) references catalogos(id),
    foreign key (assento_id) references assentos(id)
);

show tables;
describe reserva_assentos;
select *from reserva_assentos;
-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

create database hairbeauty;

use hairbeauty;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(60),
senha varchar(100),
confSenha varchar(100));

 
create table quiz (
idQuiz int primary key,
pontos int
);

create table cadastroQuiz (
fkUsuario int,
fkQuiz int,
dtHora datetime,
foreign key (fkUsuario)
references usuario(idUsuario),
foreign key (fkQuiz)
references quiz(idQuiz),
primary key (fkUsuario, fkQuiz, dtHora)
);




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
idQuiz int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
);


create table metrica(
idMetrica int auto_increment,
fkUsuario int,
fkQuiz int,
dtHora datetime default current_timestamp,
qntdAcertos int,
qntdErros int,
foreign key (fkUsuario)
references usuario(idUsuario),
foreign key (fkQuiz)
references quiz(idQuiz),
primary key (idMetrica, fkUsuario, fkQuiz)
);

select * from metrica;

insert into quiz values
(default, 'Cabelos', 'Conhecimentos gerais sobre cuidados capilares');

select * from usuario;

select avg(qntdAcertos) from metrica;

select count(idUsuario) from usuario;

SELECT COUNT(DISTINCT um.fkUsuario) AS qntdPessoasResponderam FROM metrica um
JOIN usuario u ON um.fkUsuario = u.idUsuario;

select * from  metrica join usuario on idUsuario = fkUsuario;

select * from metrica where fkUsuario = 6 order by idMetrica desc limit 1;

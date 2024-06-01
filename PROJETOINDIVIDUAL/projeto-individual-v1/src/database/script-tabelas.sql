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


create table metricas(
idMetricas int primary key auto_increment,
qntdAcertos int,
qntdErros int,
fkUsuario int,
constraint fkUsuarioMetricas foreign key (fkusuario)references usuario (idusuario)
);


create table UsuarioMetricas(
fkUsuario int,
fkMetricas int,
dtHora datetime,
foreign key (fkUsuario)
references usuario(idUsuario),
foreign key (fkMetricas)
references metricas(idMetricas),
primary key (fkUsuario, fkMetricas, dtHora)
);

select * from usuario;

select avg(qntdAcertos) from metricas;

select sum(idUsuario) from usuario;

select count(idUsuario) from usuario;

SELECT COUNT(DISTINCT um.fkUsuario) AS qntdPessoasAcessaram FROM UsuarioMetricas um
JOIN usuario u ON um.fkUsuario = u.idUsuario;

select * from  UsuarioMetricas join usuario on idUsuario = fkUsuario;

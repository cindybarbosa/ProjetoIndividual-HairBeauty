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




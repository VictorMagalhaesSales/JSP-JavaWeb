create database projetocrudnb;
use projetocrudnb;

create table usuario(
    id INT(10) AUTO_INCREMENT,
    nome VARCHAR(255) not null,
    sobrenome VARCHAR(255) not null,
    endereco VARCHAR(255) not null,
    nascimento VARCHAR(255) not null,
    telefone VARCHAR(255)  not null,
    Primary Key (id)
);

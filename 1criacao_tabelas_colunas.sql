-- Criando e utilizando o database
create database restaurante;
use restaurante;

-- Criando a infraestrutura da tabela funcionarios
create table funcionarios(
id_funcionario INT PRIMARY KEY,
nome varchar(255),
cpf varchar(14),
data_nascimento date,
endereco varchar(255),
telefone varchar(15),
email varchar(100),
cargo varchar(100),
salario decimal(10,2),
data_admissao date

);

-- Criando a infraestrutura da tabela clientes
create table clientes(
id_cliente int primary key,
nome varchar(255),
cpf varchar(14),
data_nascimento date,
endereco varchar(255),
telefone varchar(15),
email varchar(100),
data_cadastro date

);

-- Criando a infraestrutura da tabela produtos
create table produtos(
id_produto int primary key,
nome varchar(255),
descricao text,
preco decimal(10,2),
categoria varchar(100)

);

-- Criando a infraestrutura da tabela pedidos
create table pedidos(
id_pedido int primary key,
id_cliente int,
id_funcionario int,
id_produto int,
quantidade int,
preÃ§o decimal(10,2),
data_pedido date,
status varchar(50),
foreign key (id_cliente) references clientes (id_cliente),
foreign key (id_funcionario) references funcionarios (id_funcionario),
foreign key (id_produto) references produtos (id_produto)

);

-- Criando a infraestrutura da tabela info_produtos
create table info_produtos (
id_info int primary key,
id_produto int,
ingredientes text,
fornecedor varchar(255),
foreign key (id_produto) references produtos (id_produto)

);



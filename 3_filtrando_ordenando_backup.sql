-- utilizando o diretório restaurante
use restaurante;

-- asc(ordenação ascendente), desc(ordenação descendente)

-- Filtrar por campo numérico
select nome, categoria from produtos where preco > 30;

-- Filtrar por campo de data
select nome, telefone, data_nascimento from clientes where year(data_nascimento) < 1985;

-- Filtrar por campo de texto
select id_produto, descricao from produtos where descricao like "%carne%";

-- Ordenar por mais de um campo
-- O primeiro order by tem prioridade, caso os valores sejam iguais o proximo arder by entrará em cena
select nome, categoria from produtos order by categoria asc, nome asc;

-- Limitar a seleção de registros
select nome, preco from produtos order by preco desc limit 5;

-- Pulando registros com o offset
select nome from produtos where categoria = "prato principal" order by nome asc limit 2 offset 5;

-- Criando um backup
create table backup_produtos as select * from produtos;

-- Lembrando que a restrição com chave primária e o auto_increment não são criados automaticamente
desc produtos;
desc backup_produtos;

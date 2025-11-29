-- utilizando o diretório restaurante
use restaurante;

-- usando o 'count' para contar as linhas das colunas
select count(*) from pedidos;

-- usando o 'count' para contar apenas valores únicos com o 'distinct'
select count(distinct id_cliente) from pedidos;

-- usando o 'avg' para encontrar a média quantitativa de uma coluna
select avg(preco) from produtos;

-- usando o 'min' para encontrar o valor quantitativo mínimo de uma coluna
select min(preco) from produtos;

-- usando o 'max' para encontrar o valor quantitativo máximo de uma coluna
select max(preco) from produtos;

-- usando o 'row_number' para criar uma coluna de ranking
-- o order by define a ordem do ranking sendo 'desc' do numero maior para o menor e 'asc' do numero menor para o maior
select nome, preco, row_number() over (order by preco desc) as ranquing_preco from produtos limit 5;

-- usando o 'group by' para detalhar agregações quantitativas ou ordenar filtros com informações qualitativas
select categoria, avg(preco) from produtos group by categoria;
select fornecedor, count(fornecedor) as quantidade_produtos from info_produtos group by fornecedor;

-- usando o 'having' para filtrar agregações
select fornecedor, count(fornecedor) as quantidade_produtos from info_produtos group by fornecedor having quantidade_produtos > 1;
select id_cliente, count(id_cliente) as pedidos_realizados from pedidos group by id_cliente having pedidos_realizados < 2;
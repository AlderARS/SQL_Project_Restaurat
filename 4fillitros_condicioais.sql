-- utilizando o diretório restaurante
use restaurante;

-- utillizando o 'and' (adição) num filtro com condição
select * from pedidos where id_funcionario = 4 and status = 'Pendente';

-- utillizando o '<>' (diferente) num filtro com condição
select * from pedidos where status <> 'Concluido';

-- utilizando o 'in' (contido) num filtro de condição
select * from pedidos where id_produto in (1, 3, 5, 7, 8);

-- utilizando o 'between' (entre) num filtro de condição
select nome, preco from produtos where preco between 20 and 30;

-- utilizando o 'like' (parecido) num filtro de condição
-- o coringa '%' pode ser usado antes, depois ou em ambos os lados da chave de pesquisa
-- é preferível usar o coringa após a chave de pesquisa para melhor o desempenho
-- também é possível usar o underline + o coringa '_%' para definir um minímo de caracteres
select nome from clientes where nome like 'c%';
select nome, descricao from produtos where descricao like '%carne%' or '%frango%';
select email from funcionarios where email like '__%@___mail.com';

-- utilizando o 'nullif' e o 'ifnull' num filtro de condição
-- nullif = o campo se tornará nulo se...
-- ifnull = se o campo for nulo se tornará...
select *, nullif (id_pedido, 6) from pedidos;
select id_pedido, status, ifnull(status, 'Cancelado') from pedidos;

-- utilizando o 'if' (se) num filtro de condição
-- pode-se definir o que acontecerá caso o if seja falso logo em seguida de declarar o resultado caso seja verdadeiro
select nome, cargo, salario, if(salario > 300, 'Acima da média', 'Abaixo da média') as media_salario from funcionarios;

-- utilizando 'is null' num filtro de condição
select * from pedidos where status is null;

-- atualizando um valor para 'null'
update pedidos set status = null where id_pedido = 6;
-- utilizando o diretório restaurante
use restaurante;

-- utilizando inner join em duas tabelas
select pr.id_produto, pr.nome, inf.ingredientes, pr.descricao from produtos pr join info_produtos inf on pr.id_produto = inf.id_produto;

-- utilizando o inner join em duas tabelas
select pe.id_pedido, pe.quantidade, pe.data_pedido, cl.nome, cl.email from pedidos pe join clientes cl on pe.id_cliente = cl.id_cliente;

-- utilizando o inner join em três tabelas
select pe.id_pedido, pe.quantidade, pe.data_pedido, cl.nome, cl.email, func.nome from pedidos pe
join clientes cl on pe.id_cliente = cl.id_cliente
join funcionarios func on pe.id_funcionario = func.id_funcionario;

-- utilizando o inner join em quatro tabelas
select pe.id_pedido, pe.quantidade, pe.data_pedido, cl.nome, cl.email, func.nome, pr.nome, pr.preco from pedidos pe
join clientes cl on pe.id_cliente = cl.id_cliente
join funcionarios func on pe.id_funcionario = func.id_funcionario
join produtos pr on pe.id_produto = pr.id_produto;

-- -- -- PARTE 2 -- -- --

-- usando inner join com condição com resultado em ordem alfabética
select pe.id_pedido, cl.nome from pedidos pe join clientes cl on pe.id_cliente = cl.id_cliente where pe.status = "pendente" order by pe.id_pedido desc;

-- usando inner join com condição de nulidade
select cl.nome from clientes cl left join pedidos pe on cl.id_cliente = pe.id_cliente where pe.id_pedido is null;

-- usando subconsultas com o 'where'
-- subconsultas, isso significa select dentro de select = select(select)
select cl.nome, (select count(*) from pedidos pe where cl.id_cliente = pe.id_cliente) as total_pedidos from clientes cl order by total_pedidos desc;
select pedidos.id_pedido, (select sum(pedidos.quantidade * pr.preco) from produtos pr where pedidos.id_produto = pr.id_produto) as preco_total from pedidos;

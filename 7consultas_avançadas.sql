use restaurante;

-- Criando view com 4 joins
create view resumo_pedido as
select pe.id_pedido, pe.quantidade, pe.data_pedido, cl.nome as nome_cliente, cl.email, func.nome as nome_funcionario, pr.nome as nome_produto, pr.preco
from pedidos pe
join clientes cl on cl.id_cliente = pe.id_cliente
join funcionarios func on func.id_funcionario = pe.id_funcionario
join produtos pr on pr.id_produto = pe.id_pedido;

-- Verificando a criação de uma agragação  
select id_pedido, nome_cliente, sum(quantidade * preco) as total from resumo_pedido group by id_pedido;

-- Atualizando a view anterior, adicionando a agregação acima
create or replace view resumo_pedido as
select pe.id_pedido, pe.data_pedido, cl.nome as nome_cliente, cl.email, func.nome as nome_funcionario, pr.nome as nome_produto, pe.quantidade, pr.preco, sum(quantidade * preco) as total
from pedidos pe
join clientes cl on cl.id_cliente = pe.id_cliente
join funcionarios func on func.id_funcionario = pe.id_funcionario
join produtos pr on pr.id_produto = pe.id_pedido
group by id_pedido;

-- Verificando a utilidade do campo total criado anteriormente
select id_pedido, nome_cliente, total from resumo_pedido;

-- Utilizando o 'explain' para compreender a formatação dos campos
explain select id_pedido, nome_cliente, total from resumo_pedido;

-- Definindo uma função
delimiter //
create function BuscaIngredientesProduto (idProduto int)
returns varchar (300)
reads sql data
begin
declare ingredientesProduto varchar(300);
select descricao into ingredientesProduto from produtos where id_produto = idProduto;
return ingredientesProduto;
end //
delimiter ;

-- Usando a função acima
select BuscaIngredientesProduto(10);

-- Definindo outra função
delimiter //
create function mediaPedido (idPedido int)
returns varchar (100)
reads sql data
begin
declare totalVendas decimal(10,2);
declare desempenho varchar(100);
select coalesce(sum(pe.quantidade * pr.preco), 0) into totalVendas
from produtos pr
left join pedidos pe on pr.id_produto = pe.id_produto;
-- início da criação da coluna nível de desempenho
set desempenho =
case
	when totalVendas = 0 then 'Sem vendas'
    when totalVendas <=1000 then 'Baixo'
    when totalVendas <= 5000 then 'MÃŠdio'
    else 'Alto' 
end;
return desempenho;
-- fim da criação da coluna nível de desempenho
end //
delimiter ;

-- usando a função acima
select mediaPedido(5);
select mediaPedido(6);
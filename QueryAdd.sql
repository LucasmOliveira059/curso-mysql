use cafeteria;
select * from produtos;
select * from pedidos;

select produtos.name, pedidos.data_pedido from pedidos
inner join produtos on pedidos.produto_id = produtos.id;

-- Exercicio 7: Combine três tabelas (JOIN encadeado).

SELECT cliente.nome, produto.nome AS produto, pedido.valor
FROM pedidos pedido
JOIN clientes  cliente ON pedido.cliente_id = cliente.id
JOIN produtos produto ON pedido.produto_id = produto.id;
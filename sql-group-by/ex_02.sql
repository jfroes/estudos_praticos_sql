-- Exercicio 02: Some total de pedidos por cliente.

SELECT cliente.nome, COUNT(pedido.id)
FROM clientes cliente
JOIN pedidos pedido ON cliente.id = pedido.cliente_id
GROUP BY cliente.id
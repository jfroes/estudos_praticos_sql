-- Exercicio 16: Mostre clientes com mais de 2 pedidos.

SELECT cliente.nome, SUM(pedido.id) as total_pedidos
FROM clientes cliente
JOIN pedidos pedido ON cliente.id = pedido.cliente_id
GROUP BY cliente.id
HAVING SUM(pedido.id) > 2
ORDER BY cliente.nome ASC